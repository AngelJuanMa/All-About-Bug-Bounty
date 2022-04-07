# CheatSheet

* curl --help && man \<tool\>: Display the documentation of a tool.
* apropos \<keyword\>: Display short description.
* whoami: Displays current username.
* id: Returns users identity
* hostname: Sets or prints the name of current host system.
* uname && uname -a:	Prints basic information about the operating system name and system hardware.
* uname -r: Returns kernel Release
* pwd: Returns working directory name.
* ifconfig: The ifconfig utility is used to assign or to view an address to a network interface and/or configure network interface parameters.
* ip: Ip is a utility to show or manipulate routing, network devices, interfaces and tunnels.
* netstat: Shows network status.
* ss: Another utility to investigate sockets.
* ps: Shows process status.
* who: Displays who is logged in.
* env: Prints environment or sets and executes command.
* lsblk: Lists block devices.
* lsusb: Lists USB devices
* lsof: Lists opened files.
* lspci: Lists PCI devices.
* ssh [username]@[IP address]
* useradd: Creates a new user or update default new user information.
* userdel: Deletes a user account and related files.
* usermod: Modifies a user account.
* addgroup: Adds a group to the system.
* delgroup:	Removes a group from the system.
* passwd: Changes user password.

### Execution as a user
```sh
name@DESKTOP-AI3XR0D$ cat /etc/shadow
cat: /etc/shadow: Permission denied
```

### Execution as root
```sh
name@DESKTOP-AI3XR0D$ cat /etc/shadow
root:<SNIP>:18395:0:99999:7:::
daemon:*:17737:0:99999:7:::
bin:*:17737:0:99999:7:::
<SNIP>
```
