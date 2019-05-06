#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>

#ifndef __LIBMYSHM__
int myshm_open(const char *name, int oflag, mode_t mode);
int myshm_unlink(const char *name);
#endif

