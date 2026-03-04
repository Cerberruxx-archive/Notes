

| Directory | Function | Note |
| :---- | :---- | :---- |
| ``/`` | Root directory |  |
| /bin | Contains binaries (executables) essential to the OS. | Can be run anywhere from the shell |
| $PATH | Tells linux where to find binaries | The reason *why* binaries can be accessed from any directory in the shell |
| /sbin | System binaries that should only be executed by the root user |  |
| /lib | Shared libraries and kernels required to boot the system; runs fundamental commands from /bin and /sbin |  |
| /usr/bin | Files not essential for the OS to run; designed to be used by the end user |  |
| usr/local/bin | Files compiled manually by the user |  |
| /which | ‘Which binary is this?’; shows which directory a binary is in and retrieves its full path | Add the name of the binary after the /which directory |
| /etc | Editable Text Config; text-based config files |  |
| /home | User data |  |
| \~ | Shortcut for /home |  |
| /boot | Files for system booting |  |
| /dev | Device files; where you can access drivers and hardware like regular files and create disk partitions |  |
| /opt | Add-on software |  |
| /var | Variables that change as the OS is being used | Log files, cache files, etc. |
| /tmp | Temporary files lost after system reboots |  |
| /proc | Created by the kernel as a virtual directory to keep track of running processes | Isn’t actually a part of the disk. |

