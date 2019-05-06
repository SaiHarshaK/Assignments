#include <iostream>
#include <cstring>

using namespace std;

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>        /* For mode constants */
#include <syslog.h>
#include <linux/limits.h>
#include <dirent.h>
#include <sys/types.h>
#include <sys/sysmacros.h>
#include <errno.h>
#include <time.h>
#include <string.h>
#include <libmyshm.hpp>

// The standard shm_open(3) creates shm file in /dev/shm.
// We cannot create our shm file in /dev/shm and get calls into mykmod's
// fops/vmops. So we will use /tmp as our base directory.
// In the /tmp create a DSF using mknod with mykmod's major no,
// and an unused minor no (find by walking through /tmp
// using opendir(3), readdir(3), closedir(3)).
// Use mylock() and myunlock() to synchronize racing shm_open(,O_CREAT,)
// shm_unlink() calls.

static const char dirprefix[] = "/tmp/";
static const char lockfile[] = "/tmp/.myshm.lock";

static int mylock(int lockfd, int mode);
static int myunlock(int lockfd);

void swap(unsigned int* num1, unsigned int* num2) {
        unsigned int temp = *num1;
        *num1 = *num2;
        *num2 = temp;

        return;
}

int partition (unsigned int arr[], int low, int high) {
        unsigned int pivot = arr[high];    // pivot
        int i = (low - 1);  // Index of smaller element

        for (int j = low; j <= high- 1; j++) {
                // If current element is smaller than or
                // equal to pivot
                if (arr[j] <= pivot) {
                        i++;    // increment index of smaller element
                        swap(&arr[i], &arr[j]);
                }
        }
        swap(&arr[i + 1], &arr[high]);
        return (i + 1);
}

void quickSort(unsigned int arr[], int low, int high) {
        if (low < high) {
                int pi = partition(arr, low, high);
                quickSort(arr, low, pi - 1);
                quickSort(arr, pi + 1, high);
        }
}

int myshm_open(const char *name, int oflag, mode_t mode) {
#if 1
	int ret = -1;
        unsigned int major_id;

        FILE *fptr = fopen("/proc/devices", "r");

        if (fptr == NULL) {
                syslog(LOG_ERR, "Error opening file - /proc/devices\n");
                ret = -1;
                return ret;
        }

        int lockfd = open(lockfile, O_RDONLY | O_CREAT);
        if (lockfd < 0) {
                syslog(LOG_ERR, "Error acquiring lock\n");
                ret = -errno;
                fclose(fptr);
                return ret;
        }

        char* line = (char*)calloc(128, sizeof(char));

        mylock(lockfd, F_WRLCK);

        // take the heading
        fscanf(fptr, "%[^\n]\n", line);
        //now parse the major numbers and device id
        bool obtain_major_id = false;
        while ( fscanf(fptr, "%[^\n]\n", line) != EOF ) {
                // find the driver
                if (strstr(line, "mykmod") != NULL) { // found it
                        obtain_major_id = true;
                        int check;
                        char* file_name = (char*)calloc(128, sizeof(char));
                        if ( (check = sscanf(line, "%d %s", &major_id, file_name)) != 2 ) {
                                syslog(LOG_ERR, "Error getting major number\n");
                                ret = -check;
                                free(file_name);free(line);
                                fclose(fptr);
                                myunlock(lockfd);
                                close(lockfd);
                                return ret;
                        } // else - obtained major number
                        free(file_name);
                        break;
                }
        }

        free(line);

        if (obtain_major_id == false) { // didnt find the driver
                syslog(LOG_ERR, "Driver did not load\n");
                ret = -ENXIO;
                fclose(fptr);
                myunlock(lockfd);
                close(lockfd);
                return ret;
        }


        // get max of all minor numbers
        struct dirent *dir_entry;  // pointer to directory entrance

        // get pointer of DIR type
        DIR *dir = opendir(dirprefix);

        if (dir == NULL) {// error opening directory
                syslog(LOG_ERR, "Error opening /tmp/ directory\n");
                ret = -ENOENT;
                fclose(fptr);
                myunlock(lockfd);
                close(lockfd);
                return ret;
        }

        // get a sorted list of minor numbers
        char* path = (char*)calloc(128, sizeof(char));
        char* aug_name = (char*)calloc(128, sizeof(char)); // to remove the '/' in front of the name
        int index = 0, len = strlen(name);
        for (index = 0; index < len - 1; index++) {
          aug_name[index] = name[index + 1];
        }
        aug_name[index] = '\0';

        struct stat file_stat;
        unsigned int minor_list[256] = { 0 }, list_len = 0;

        while ((dir_entry = readdir(dir)) != NULL) {// get the names of files
                sprintf(path, "%s%s", dirprefix, dir_entry->d_name);
                if (stat(path, &file_stat) == -1) {
                        syslog(LOG_ERR, "Could not get Stat of files in /tmp/ \n");
                        ret = -errno;
                        fclose(fptr);
                        free(path);free(aug_name);
                        myunlock(lockfd);
                        close(lockfd);
                        closedir(dir);
                        return ret;
                }

                if (((int)file_stat.st_mode == (int)(S_IFCHR| S_IRWXU)) && major_id == major(file_stat.st_rdev)) {
                        minor_list[list_len++] = minor(file_stat.st_rdev);
                }
                else continue;

                if (strcmp(dir_entry->d_name, aug_name) == 0) { // file already exists in the path - /tmp/
                        sprintf(path, "%s%s", dirprefix, name);
                        ret = open(path, oflag, mode);
                        if (ret == -1) {
                                syslog(LOG_ERR, "Error opening the shared object file\n");
                                ret = -errno;
                        }
                        free(path);free(aug_name);
                        fclose(fptr);
                        myunlock(lockfd);
                        close(lockfd);
                        closedir(dir);
                        return ret;
                }
        }

        closedir(dir);

        // sort the list
        quickSort(minor_list, 0, list_len - 1);

        // iterate the minor list and find a suitable minor number
        unsigned minor_id = 0;
        if (list_len == 0) {
                minor_id = 1;
        } else if (minor_list[0] != 0 && minor_list[0] != 1) {
                minor_id = 1;
        } else {
                int index;
                for (index = 1; index < list_len; index++) {
                        if (minor_list[index] > minor_list[index - 1] + 1) {
                                minor_id = minor_list[index - 1] + 1;
                                break;
                        }
                }
                if (index == list_len) minor_id = minor_list[index - 1] + 1;
                if (minor_id > 255) {
                        syslog(LOG_ERR, "Too many files are open\n");
                        ret = -EMFILE;
                        free(aug_name);free(path);
                        fclose(fptr);
                        myunlock(lockfd);
                        close(lockfd);
                        return ret;
                }
        }

        // construct file name
        sprintf(path, "%s%s", dirprefix, aug_name);
        free(aug_name);

        int mknod_stat = mknod(path, S_IFCHR| S_IRWXU, makedev(major_id, minor_id));
        stat(path, &file_stat);

        if (mknod_stat == -1) { // error occured
                syslog(LOG_ERR, "Error occured while creating the special file..\n");
                ret = -errno;
                free(path);
                fclose(fptr);
                myunlock(lockfd);
                close(lockfd);
                return ret; // number of last error
        }

        ret = open(path, oflag, mode);
        if (ret == -1) {
                ret = -errno;
                syslog(LOG_ERR, "Error opening file\n");
        }
        free(path);
        fclose(fptr);
        myunlock(lockfd);

        close(lockfd);

	return ret;
#else
	return shm_open(name, oflag, mode);
#endif
}

int myshm_unlink(const char *name)
{
#if 1
	int ret = -1;

        int lockfd = open(lockfile, O_RDONLY | O_CREAT);
        mylock(lockfd, F_WRLCK);

        char* path = (char*)calloc(128, sizeof(char));
        sprintf(path, "%s%s", "/tmp/", name);

        ret = unlink(path);
        if (ret == -1) ret = -errno;

        free(path);

        myunlock(lockfd);
        close(lockfd);

	return ret;
#else
	return shm_unlink(name);
#endif
}

static int mylock(int lockfd, int mode)
{
        struct flock fl;

        fl.l_type = mode;
        fl.l_whence = SEEK_SET;
        fl.l_start = 0;
        fl.l_len = 0;
        if (fcntl(lockfd, F_SETLKW, &fl) != 0) {
                syslog(LOG_ERR, "Not Locked\n");
                return 1;
        }
	return 0;
}

static int myunlock(int lockfd)
{
        struct flock fl;

        fl.l_type = F_UNLCK;
        fl.l_whence = SEEK_SET;
        fl.l_start = 0;
        fl.l_len = 0;
        if (fcntl(lockfd, F_SETLK, &fl) != 0) {
                syslog(LOG_ERR, "Not Unlocked\n");
		return 1;
        }
	return 0;
}

