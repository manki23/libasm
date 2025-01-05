#include <stdio.h> // For printf
#include <fcntl.h> // For Open
#include "libasm.h"

void test_ft_strlen() {
    printf("\n*** Testing ft_strlen: ***\n");
    printf("Empty string: %zu\n", ft_strlen(""));
    printf("Long string: %zu\n", ft_strlen("This is a very long string used to test the ft_strlen function implementation."));
}

void test_ft_strcpy() {
    printf("\n*** Testing ft_strcpy: ***\n");
    char dest[100];

    printf("Copy empty string: {%s}\n", ft_strcpy(dest, ""));
    printf("Copy long string: {%s}\n", ft_strcpy(dest, "This is a long string for ft_strcpy."));
}

void test_ft_strcmp() {
    printf("\n*** Testing ft_strcmp: ***\n");
    printf("Both empty strings: %d\n", ft_strcmp("", ""));
    printf("First empty, second non-empty: %d\n", ft_strcmp("", "Hello"));
    printf("First non-empty, second empty: %d\n", ft_strcmp("Hello", ""));
    printf("Equal strings: %d\n", ft_strcmp("Hello", "Hello"));
    printf("Different strings: %d\n", ft_strcmp("Hello", "World"));
    printf("Switching arguments: %d\n", ft_strcmp("World", "Hello"));
}

void test_ft_write() {
    printf("\n*** Testing ft_write: ***\n");
    ssize_t ret;

    // Writing to stdout
    ret = ft_write(1, "Hello, World!\n", 14);
    printf("Return value (stdout): %zd\n", ret);

    // Writing to a file
    int fd = open("test_write.txt", O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (fd < 0) {
        printf("Failed to open file");
        return;
    }
    ret = ft_write(fd, "Writing to a file! \n", 20);
    printf("Return value (file): %zd\n", ret);
    close(fd);

    // Writing with an invalid file descriptor
    ret = ft_write(-1, "Invalid FD!\n", 12);
    perror("Invalid FD");
    printf("Return value (invalid FD): %zd\n", ret);
}

void test_ft_read() {
    printf("\n*** Testing ft_read: ***\n");
    ssize_t ret;
    char buf[50];

    // Reading from stdin
    printf("Enter text for ft_read (stdin): ");
    fflush(stdout);

    ret = ft_read(0, buf, 49);
    if (ret > 0) {
        buf[ret] = '\0';
        printf("Read from stdin: %s\n", buf);
    }

    // Reading from a file
    int fd = open("test_write.txt", O_RDONLY);
    if (fd < 0) {
        printf("Failed to open file\n");
        return;
    }
    ret = ft_read(fd, buf, 49);
    if (ret > 0) {
        buf[ret] = '\0';
        printf("Read from file: %s\n", buf);
    }
    close(fd);

    // Reading with an invalid file descriptor
    ret = ft_read(-1, buf, 49);
    printf("Return value (invalid FD): %zd\n", ret);
}


void test_ft_strdup() {
    printf("\n*** Testing ft_strdup: ***\n");
    char *dup;

    dup = ft_strdup("");
    printf("Duplicate empty string: '%s'\n", dup);
    free(dup);

    dup = ft_strdup("This is a very long string to test ft_strdup!");
    printf("Duplicate long string: '%s'\n", dup);
    free(dup);
}

int main() {
    test_ft_strlen();
    test_ft_strcpy();
    test_ft_strcmp();
    test_ft_write();
    test_ft_read();
    test_ft_strdup();
    return 0;
}
