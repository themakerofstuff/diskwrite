#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <dw/dw.h>


int main(int argc, char** argv) {
	writetodisk(argc, argv);
	return 0;
}
