Arch Rescue is a rescue/install medium.  It is designed for basic rescue operations or an install.

## Download



## About

Arch Rescue includes a fairly well-configured `bashrc` and `vimrc` and a few additional utilities, including:

* gptfdisk
* grub
* hwinfo
* iotop
* irsii
* links
* nmap
* openssh
* partclone
* parted
* partimage
* rsync
* smartmontools
* testdisk
* tmux
* tree
* wgetpaste

Also the AUR installer `packer` is included and a general pacman wrapper called `arpa`.

## Setup

The live medium is helped with some additional environmental setup.  The script `arsetup` is run on first login, and can be run manually.  It sets: **keyboard layout**, **locale**, **time zone**, **password**, and the **time**.  For selections that scroll past the viewable area use **Ctrl** + **PgUp/Dn**.  Entries labeled with parenthesis are the `(detected)` values and entries with brackets will be the **Enter** to set `[default]` value.

If using a wide screen display, think about using `tmux`.  `tmux` is a console splitter.  It can divide the screen into two console sessions (useful, e.g., for reading content on one side and performing actions on another).  Type `tmux` to begin then `Ctrl` + `b` to get to command reception.  In command reception type `%` to split the console vertically; after that type `;` to switch between panes.

The SSH daemon is not started by default for security reasons.  To start run: `systemctl start sshd.service`.  Before starting the service consider adding `ListenAddress 192.168.1.0/24` to `/etc/ssh/sshd_config` or the appropriate local network address to limit connections if only using a local network.

## Install

I recommend following the [install guide](https://wiki.archlinux.org/index.php/Installation_guide) with the few alterations below.

### Mirror list

Run `armrr` to download a ranked, mirror list for your region.  This will help download speeds.

### Installation

Install directly with pacman:

    pacman --root /mnt/arch/ --config /etc/pacman.conf -Sy base *base-devel

Chroot:

    systemd-nspawn --capability=CAP_MKNOD --register=no -M ${HOSTNAME}(chroot) -D /mnt/arch/

Easy setup of **locale**, **time zone**, **hostname**, and **root password**:

    systemd-firstboot --prompt
