#include <linux/uaccess.h>
#include <linux/fs.h>
#include <linux/module.h>
#include <linux/slab.h>
#include <linux/mm.h>
#include <linux/mutex.h>

#include <myshm.h>

MODULE_DESCRIPTION("My kernel module - mykmod");
MODULE_AUTHOR("Sai Harsha Kottapalli");
MODULE_LICENSE("GPL");

// Dynamically allocate major no
#define MYKMOD_DEV_MAJOR 0

static int mykmod_init_module(void);
static void mykmod_cleanup_module(void);

static int mykmod_open(struct inode *inode, struct file *filp);
static int mykmod_close(struct inode *inode, struct file *filp);
static ssize_t mykmod_read(struct file *, char *, size_t, loff_t *);
static ssize_t mykmod_write(struct file *, const char *, size_t, loff_t *);
static loff_t mykmod_lseek(struct file *, loff_t, int);
static int mykmod_mmap(struct file *filp, struct vm_area_struct *vma);

module_init(mykmod_init_module);
module_exit(mykmod_cleanup_module);

static struct file_operations mykmod_fops = {
  .owner  = THIS_MODULE,  /* owner (struct module *) */
  .open   = mykmod_open,  /* open */
  .release  = mykmod_close,     /* release */
  .read   = mykmod_read,  /* read */
  .write  = mykmod_write, /* write */
  .llseek = mykmod_lseek, /* lseek */
  .mmap = mykmod_mmap,  /* mmap */
};

static void mykmod_vm_open(struct vm_area_struct *vma);
static void mykmod_vm_close(struct vm_area_struct *vma);
//static int mykmod_vm_fault(struct vm_fault *vmf);
static int mykmod_vm_fault(struct vm_area_struct *vma, struct vm_fault *vmf);

static const struct vm_operations_struct mykmod_vm_ops = {
  .open  = mykmod_vm_open,
  .close = mykmod_vm_close,
  .fault = mykmod_vm_fault
};


int mykmod_major;
static DEFINE_MUTEX(myk_mutex); // for mutex lock

static int mykmod_init_module(void) {

  printk("mykmod loaded\n");
  printk("mykmod initialized at=%p\n", init_module);

  if ((mykmod_major = register_chrdev(MYKMOD_DEV_MAJOR,"mykmod",&mykmod_fops))<0) {
    printk(KERN_WARNING "Failed to register character device\n");
    return 1;
  }
  else {
    printk("register character device %d\n", mykmod_major);
    printk("&fops=%p open=%p close=%p\n", &mykmod_fops, mykmod_open, mykmod_close);
  }

  // initialize mutex
  mutex_init(&myk_mutex);

  return 0;
}

static void mykmod_cleanup_module(void) {

  printk("mykmod unloaded\n");
  unregister_chrdev(mykmod_major,"mykmod");
  mutex_destroy(&myk_mutex);

  return;
}

static int
mykmod_open(struct inode *inodep, struct file *filep) {
  printk("mykmod_open: inodep=%p filep=%p i->private_data=%p f->private_data=%p\n",
    inodep, filep, inodep->i_private, filep->private_data);

  if (!mutex_trylock(&myk_mutex)) { // can't obtain the lock, exit
    printk("Lock is in use, can't obtain...\n");
    return -EBUSY;
  }

  if (inodep->i_private == NULL)
    inodep->i_private = (char*)kmalloc((MYSHM_LEN) * sizeof(char), GFP_KERNEL);

  filep->private_data = inodep->i_private;

  mutex_unlock(&myk_mutex);

  return 0;
}

static int
mykmod_close(struct inode *inodep, struct file *filep) {
  printk("mykmod_close: inodep=%p filep=%p\n", inodep, filep);

  if (!mutex_trylock(&myk_mutex)) { // can't obtain the lock, exit
    printk("Lock is in use, can't obtain...");
    return -EBUSY;
  }

  mutex_unlock(&myk_mutex);

  return 0;
}

static ssize_t
mykmod_read(struct file *filep, char *userbufp, size_t size, loff_t *loffp) {
  size_t len_to_read = size, error_bytes;

  printk("mykmod_read: filep=%p userbuf=%p size=%lu loff=%lld\n", filep, userbufp, size, *loffp);

  if (len_to_read > MYSHM_LEN - *loffp) {
    len_to_read = MYSHM_LEN - *loffp;
  }

  if (len_to_read == 0) { // nothing to read
    printk("Can't read anymore..\nReached the end.\n");
    return -ENOSPC;
  }
  /* signature -> (to, from, size) */
  error_bytes = copy_to_user(userbufp, (filep->private_data + *loffp), len_to_read);

  if (error_bytes == 0) {
    printk("successfully read..\n");
    *loffp += len_to_read;
    return len_to_read;
  }
  else {
    printk("Error occured while reading... Could read only %lu bytes\n", len_to_read - error_bytes);
    *loffp += len_to_read - error_bytes;
    return len_to_read - error_bytes;
  }


  return 0;
}

static ssize_t
mykmod_write(struct file *filep, const char *userbufp, size_t size, loff_t *loffp) {
  size_t len_to_write = size, error_bytes;
  printk("mykmod_write: filep=%p userbuf=%p size=%lu loff=%lld\n", filep, userbufp, size, *loffp);

  if (len_to_write > MYSHM_LEN - *loffp) {
    len_to_write = MYSHM_LEN - *loffp;
  }

  if (len_to_write == 0) { // nothing to write
    printk("Can't write anymore..\nReached the end.\n");
    return -ENOSPC;
  }
  /* signature -> (to, from, size) */
  error_bytes = copy_from_user((filep->private_data + *loffp), userbufp, len_to_write);

  if (error_bytes == 0) {
    printk("successfully written..\n");
    *loffp += len_to_write;
    return len_to_write;
  }

  // error occured
  printk("Error occured while writing... Could write only %lu bytes\n", len_to_write - error_bytes);
  *loffp += len_to_write - error_bytes;
  return len_to_write - error_bytes;

}

static loff_t
mykmod_lseek(struct file *filep, loff_t loff, int whence) {
  // error handle for loff
  loff_t loff_handler;
  printk("mykmod_lseek: filep=%p loff=%lld whence=%d\n", filep, loff, whence);

  if (whence == 0) { // SEEK_SET
    loff_handler = loff;

    if (loff_handler < 0) loff_handler = 0;
    else if (loff_handler > MYSHM_LEN) loff_handler = MYSHM_LEN;

    return (filep->f_pos = loff_handler);
  } else if (whence == 1) { // SEEK_CUR
    loff_handler = loff + filep->f_pos;

    if (loff_handler < 0) loff_handler = 0;
    else if (loff_handler > MYSHM_LEN) loff_handler = MYSHM_LEN;

    return (filep->f_pos = loff_handler);
  } else { // SEEK_END
    return -EINVAL;
  }

  return 0;
}

static int mykmod_mmap(struct file *filep, struct vm_area_struct *vma)
{
  printk("mykmod_mmap: filp=%p vma=%p\n", filep, vma);

  vma->vm_ops = &mykmod_vm_ops;
  vma->vm_flags |= VM_DONTDUMP| VM_DONTEXPAND; // dont include in core dump and cannot expand with mremap()
  vma->vm_private_data = filep->private_data;
  mykmod_vm_open(vma);

  return 0;
}

static void
mykmod_vm_open(struct vm_area_struct *vma)
{
  printk("mykmod_vm_open: vma=%p\n", vma);

  // TODO 7
}

static void
mykmod_vm_close(struct vm_area_struct *vma)
{
  printk("mykmod_vm_close: vma=%p\n", vma);

  // TODO 8
}

static int
mykmod_vm_fault(struct vm_area_struct *vma, struct vm_fault *vmf)
{
  struct page *page;

  // do error checking here
  if ((unsigned long int)vmf->virtual_address > (unsigned long int)vma->vm_end) {
    printk("Invalid address, sigbus\n");
    return -VM_FAULT_SIGBUS;
  }

  if (vma->vm_private_data) {
      page = virt_to_page(vma->vm_private_data + (vmf->pgoff * PAGE_SIZE));
      get_page(page);
      vmf->page = page;
  } else {
    printk("Seg fault\n");
    return -VM_FAULT_SIGSEGV;
  }

  return 0;
}


