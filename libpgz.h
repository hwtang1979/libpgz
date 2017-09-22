#ifndef __LIBPIGZ_H__
#define __LIBPIGZ_H

#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#ifdef __cplusplus
extern "C" {
#endif

int pgzf(int argc, char **argv);

// open a file for parallel compress
int pgzopen(const char *path, int flags);

// close a file
int pgzclose(int fd);

// parallel compress buf, and write compressed data to fd
int pgzwrite(int fd, const void *buf, size_t size, int more);

#ifdef __cplusplus
}
#endif

#endif

