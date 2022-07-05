# Hello there! This is `diskwrite`.
Welcome!

This is `diskwrite`,  an application meant for writing disk images to disks. This is an alternative to the Linux `dd` command.

This program also includes a disk writing library.

# Installation
The following programs are required for compilation:
- `git`
- `gcc`
- `make`
- `sudo`

You can install these through your package manager.

For Arch:
```
sudo pacman -Sy git base-devel
```

For Debian, Ubuntu and their derivatives:
```
sudo apt install git build-essential sudo
```

For Fedora:
```
sudo dnf install git gcc make sudo
```

Once you have these installed, follow the steps below:

1. Clone this repository.

2. Compile the library (`libdw.so`):
```
make lib
```

3. Install the library:
```
sudo make install-lib
```

4. Make the program itself:
```
make prog
```

5. Install the program itself:
```
sudo make install-prog
```

Alternatively, instead of doing steps 2, 3, 4 and 5, run this command to make AND install the library and program:
```
sudo make all
```

You're all done!

# Usage

This tool must be run as root (or with `sudo`).

`diskwrite-cli SOURCE DESTINATION`

SOURCE: the disk image you want to write.

DESTINATION: the disk you want to write it to, e.g. `/dev/sda`.

# Notes:

- If you specify a source file that doesn't exist, or you don't provide any arguments at all, the program will throw a `Segmenttaion fault` error.
- You can use the library (`libdw.so`) in any of your own projects, but when compiling them make sure to add the `-ldw` command argument to `gcc`.

# Distribution

You can modify the library or the program in any way and redistribute it, just make sure you credit me!
