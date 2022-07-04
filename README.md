# Hello there! This is `diskwrite`.
Welcome!

This is `diskwrite`,  an application meant for writing disk images to disks. This is an alternative to the Linux `dd` command.

# Installation
The following programs are required for compilation:
- `git`
- `meson`
- `ninja`

You can install these through your package manager.

For Arch:
```
sudo pacman -Sy git meson ninja
```

For Debian, Ubuntu and their derivatives:
```
sudo apt install git meson ninja
```

For Fedora:
```
sudo dnf install git meson ninja
```

Once you have these installed, follow the steps below:

1. Clone this repository.
2. `cd` into it and create a new directory, called build (and `cd` into that):

```
mkdir build && cd build
```

3. Run the following command to configure:

```
meson --prefix=/usr ..
```

4. Compile it:

```
ninja
```

5. Install it:

```
sudo ninja install
```

You're all done!


# Usage

This tool must be run as root (or with `sudo`).

`diskwrite-cli SOURCE DESTINATION`

SOURCE: the disk image you want to write.

DESTINATION: the disk you want to write it to, e.g. `/dev/sda`.
