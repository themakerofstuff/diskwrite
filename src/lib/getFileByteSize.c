#include <malloc.h>

unsigned long get_file_byte_num(const char * filename) {
    FILE *fp = fopen(filename, "r");
    fseek(fp, 0, SEEK_END);
    return ftell(fp);
}