#ifndef LIBASM_H
#define LIBASM_H

#include <stddef.h> // For size_t
#include <errno.h>  // For errno

#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <stdlib.h> // For malloc & free
#include <stdio.h>

// Function prototypes
size_t      ft_strlen(const char *s);
ssize_t     ft_write(int fd, const void *buf, size_t count);
ssize_t     ft_read(int fd, void *buf, size_t count);
int         ft_strcmp(const char *s1, const char *s2);
char        *ft_strcpy(char *dest, const char *src);
char        *ft_strdup(const char *s);

#endif // LIBASM_H
