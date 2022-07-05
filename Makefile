lib:
	@echo Making libdw.so
	gcc -c -O2 -fPIC -o obj/getFileByteNum.o src/lib/getFileByteNum.c
	gcc -c -O2 -fPIC -o obj/main.o src/lib/main.c
	gcc -O2 -shared -o lib/libdw.so obj/getFileByteNum.o obj/main.o

install-lib:
	@echo Installing libdw.so
	cp lib/libdw.so /usr/lib/
	ldconfig
	@echo Installing dw.h
	mkdir -p /usr/include/dw
	cp src/lib/include/dw.h /usr/include/dw/dw.h
	ldconfig
