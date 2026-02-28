# About Gentoo Linux
(Sources: Gentoo Wiki, Google AI)

## Installation Process
The good thing about Gentoo is its accessibility. It can be downloaded from things ranging from official Gentoo installation media (such as ISO images), a USB stick, via a netbooted environment, or from non-official media like an already-installed Linux distro or a non-Gentoo bootable disk (e.g. Linux Mint).

## Procedure Steps
1) User is in a working environment prepared to install Gentoo
2) Internet connection is stable
3) Hard disks initialized to host process
4) Installation environment prepared for user to chroot into the net environment
5) Core Gentoo packages installed
6) Linux kernel installed
7) Most Gentoo system configuration files created
8) Necessary system tools installed
9) Proper boot loader has been installed and configured
10) Gentoo environment installed and ready to use

## Some Fundamental Gentoo Features
* Portage: Gentoo's package maintenance; written in Python
* Ebuilds: provides packages for Portage; written in Bash
* ```make.conf```:the main Portage configuration file used to customize the environment on a global level
* Utilizes init systems OpenRC and system
* ```use``` flags

## Using USE flags in Gentoo
USE flags are keywords that represent support and dependency-information for a certain concept. It's a core feature that serves to configure Portage to **determine how each package will be configured on installation or update**. The available USE flags depend on each individual software piece.

They can also change an array of package behavior and set compile-time options.

Packages each have their own available USE flags. The order in which the flags are applied is specified by the USE_ORDER variable.


# OpenRC vs. Systemd
## OpenRC
Pros
* Lightweight: uses fewer system resources and has less overhead
* Simplicity: Easier to debug because the service uses shell scripts (which can just be edited via a text file for any debugging)
* Portability: can run on a non-Linux kernel (e.g. BSD) and with alternate libc libraries
Cons
* Manual setup: lacks built-in features like socket activation or process supervision by default
*Integration: some modern desktop environments (like GNOME) may require extra packages to function without system

## Systemd
Pros
* Rich features: includes built-in automated processes such as service supervision, timers (replacing cron), and advanced cgroup integration
* Consistency: used by the vast majority of Linux distros, making online docs and tutorials easier to find
* Ease of use: simplifies complex tasks (e.g. encrypted home directories, managing user-specific services)
Cons
* Bloat: some argue it's 'monolithic' and handles too many system responsibilities 
* Complexity: binary logs and a complex PID 1 can make deep troubleshooting more difficult without dedicated deassembling software

## Serial vs. Parallel Booting
* Serial: services start one after another in a specific sequence; used by OpenRC
* Parallel: multiple services start at the same time to maximize speed; used by Systemd

## Mirrors
Mirrors are servers containing an exact duplicate of the data found on a master server. In Gentoo, there is:
* Source (Disfile) mirrors that host the actual source code (**tarballs**) for the software you want to install
* rsync mirrors that host copies of the **Portage tree** (database of scripts that tell Gentoo how to build its software)

**Why use mirrors?**
Using a mirror geographically close to you reduces latency and speeds up your **emerge** (install) downloads.

**Note: You can set your preferred mirrors in Gentoo by editing your ```/etc/portage/make.conf``` file or using the **mirror select tool** to automatically pick the fastest onces.

## For Netbooting
Quick memory refresh.
**Netbooting** (network booting) is the process of starting a computer and loading its OS directly from a network server instead of a local hard driver or USB stick.
* Often used for 'diskless' systems or for installing Gentoo on multiple machines at once without needing install hardware for each

A **node** is an individual unit within a larger system. In this case, it's a single computer or server that's connected to a network.

### Process
The netbooting process relies on a small piece of firmware in the network card (NIC) called a Preboot Execution Environment (PXE).

1) Request: When the computer's turned on, the NIC sends out a broadcast message asking for an IP address and boot instructions.
2) Response: A DHCP server on the network responds with an IP and a pointer (the address of a boot server and a filename)
3) Download: The computer contacts that boot server (usually via a TFTP or HTTPS) to download a small bootloader or kernel
4) Execution: Once downloaded, the computer runs the file in its RAM, which then pulls the rest of the US over the network

**Why use Netbooting?**
* Diskless workstations (you can run a computer without a hard drive since everything's stored on a center server)
* Mass Deployment (IT admins use it to "image" hundreds of computers simultaneously)
* Rescue and recovery (If the local drive fails, you can netboot into a system rescue environment to fit it)
* Testing (Tools like netboot.xyz allow you to boot from almost any Linux installer, including Gentoo, from the web without needing to burn an ISO file)

## Miscellaneous
Daemons: long-running background processes that do tasks without direct user interaction (e.g. ```sshd``` for remote access or ```cron``` for scheduled tasks)

PID 1: the first process started by the Linux boot; the 'parent' of all other processes

Dependencies: rules that define the order in which services must start

Socket: a software endpoint that allows two processes to communicate with each other. It's like a two-way pipe for data.
* Network sockets use an IP address and a port number to let the computer talk to a server over the internet
* Unix domain sockets are specialized 'files' on the hard drive (usually in ```/run``` or ```/var/run```) that let two programs *on the same machine* communicate. It's faster than network sockets because they don't have to go through the network hardware.

Socket activation: a feature where the init system (usually systemd) opens a 'listening' socket (e.g. a network port) on behalf of a service. The service only starts when someone tries to connect to the socket, saving resources and allowing faster parallel boots.

libc: 'Standard C Library' that provides the core functions (line opening files or printing text) that are fundamental for the Linux kernel

Binary log: log file stored in a machine-readable format rather than plain text

grub: acronym for GRand Unified Bootloader; the first piece of software that runs after the computer's hardware (BIOS or UEFI) finishes its initial checks. Its main function is to load the OS kernel into memory so the computer can start.
* Bootmanager - provides a menu at startup allowing the user to choose between different operating systems (e.g. Linux or Windows) or different Linux kernel versions
* Kernel loader - once a selection is made, ```grub``` finds that specific kernel on the hard drive and gives it to the computer
* Configuration interface - it can be used to pass instructions (**parameters**) to the kernel before it starts *usually used for troubleshooting or system recovery)

Chroot (Change root): used to change a root directory separate from the system's main one

