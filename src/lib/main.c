#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <dw/dw.h>


void writetodisk(int argc, char** argv) {
    if (argc < 3) {
        perror("Incorrect number of arguments.");
    }
    int slen = strlen(argv[1]);
    int tlen = strlen(argv[2]);
    char *sname = (char*)malloc(sizeof(char)*(slen + 1));
    char *tname = (char*)malloc(sizeof(char)*(tlen + 1));
    strcpy(sname, argv[1]);
    strcpy(tname, argv[2]);

    unsigned long byte_num = get_file_byte_num(sname);
    printf("The size of the source file is% LD bytes.\n", byte_num);

    int fd = open(sname, O_RDWR|O_CREAT, 0644);
    int tfd = open(tname, O_RDWR|O_CREAT, 0644);
    ftruncate(tfd, byte_num);

    char *mem = (char*)mmap(NULL, byte_num, PROT_WRITE|PROT_READ, MAP_SHARED, fd, 0);
    if (mem == MAP_FAILED) {
        perror("Failed to map the source file to memory");
    }

    char *tmem = (char*)mmap(NULL, byte_num, PROT_WRITE|PROT_READ, MAP_SHARED, tfd, 0);
    if (tmem == MAP_FAILED) {
        perror("Failed to map the target to memory.");
    }

    close(fd);
    close(tfd);

    memcpy(tmem, mem, byte_num);

    munmap(mem, byte_num);
    munmap(tmem, byte_num);
    free(sname);
    free(tname);
}
