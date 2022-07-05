lib:
	@echo Making libdw.so
	gcc -c -O2 -fPIC -o obj/getFileByteSize.o src/lib/getFileByteSize.c
	gcc -c -O2 -fPIC -o obj/libdw-main.o src/lib/main.c
	gcc -O2 -shared -o lib/libdw.so obj/getFileByteSize.o obj/libdw-main.o

install-lib:
	@echo Installing libdw.so
	cp lib/libdw.so /usr/lib/
	ldconfig
	@echo Installing dw.h
	mkdir -p /usr/include/dw
	cp src/lib/include/dw.h /usr/include/dw/dw.h
	ldconfig

prog:
	@echo Making diskwrite-cli
	gcc -c -O2 -o obj/main.o src/cli/main.c
	gcc -O2 -ldw -o bin/diskwrite-cli obj/main.o

install-prog:
	@echo Installing diskwrite-cli
	cp bin/diskwrite-cli /usr/bin/
	chmod +x /usr/bin/diskwrite-cli

all:
	@echo Making libdw.so
	gcc -c -O2 -fPIC -o obj/getFileByteSize.o src/cli/getFileByteSize.c
	gcc -c -O2 -fPIC -o obj/main.o src/lib/main.c
	gcc -O2 -shared -o lib/libdw.so obj/getFileByteSize.o obj/main.o
	@echo Installing libdw.so
	cp lib/libdw.so /usr/lib/
	ldconfig
	@echo Installing dw.h
	mkdir -p /usr/include/dw
	cp src/lib/include/dw.h /usr/include/dw/dw.h
	ldconfig
	@echo Making diskwrite-cli
	gcc -c -O2 -o obj/main.o src/cli/main.c
	gcc -O2 -ldw -o bin/diskwrite-cli obj/main.o
	@echo Installing diskwrite-cli
	cp bin/diskwrite-cli /usr/bin/
	chmod +x /usr/bin/diskwrite-cli

clean:
	@echo Cleaning files
	rm -rf obj/*
	rm -rf bin/*
	rm -rf lib/*
	
uninstall:
	@echo Removing libraries
	rm -rf /usr/lib/libdw.so
	ldconfig
	@echo Removing programs
	rm -rf /usr/bin/diskwrite-cli
