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
~ cat /etc/shadow
cat: /etc/shadow: Permission denied
```

### Execution as root
```sh
~ sudo cat /etc/shadow
root:<SNIP>:18395:0:99999:7:::
daemon:*:17737:0:99999:7:::
bin:*:17737:0:99999:7:::
<SNIP>
```

```sh
~ echo "something" | sed 's/some/any/'
anything
~ echo "aabbcc" | sed 's/a/A/g'
AAbbcc
```

mkdir -p Storage/local/user/documents

The command mkdir has an option marked -p to add parent directories.

find -user bandit6 -group bandit6 -type f -readable ! -executable -size 1033c | xargs cat

! = no "executable"

head: 10 ⬆ First Columns 
tail: 10 ⬇ Last Columns
-n option to specify n of columns

```sh
~ find /etc/ssl/sdfsdfsdf
No such file or directory

~ find /etc/ssl/sdfsdfsdf 2>/dev/null
```

wc -l: print lines
wc -m: character counts
wc -c: bytes counts
wc -w: word counts

firefox &
disown
Convierte el proceso hijo en padre, pudiendo cerrar la consola

```bash
~ cat matrix
1 2 3 4 5
6 7 8 9 10
11 12 13 14 15
~ cat matrix | awk {'print $1'}
1
6
11
~ cat matrix | awk {'print $NF'}
5
10
15
~ cat matrix | awk '{print $1, $NF}'
1 5
6 10
11 15
```

```bash
~ cat matrix | awk '{print $2}' FS="3"
5
10
15
```
```bash
sort -u # Ordenar por lineas únicas
```

```bash
~ cat matrix | grep 2
1 2 3 4 5
11 12 13 14 15
~ cat matrix | grep -v 2
6 7 8 9 10
~ cat matrix | grep -v 2 -A 2
6 7 8 9 10
11 12 13 14 15
~ cat matrix | grep "0\|6"
6 7 8 9 10
```

```bash
~ cat /etc/passwd | grep "false\|nologin"
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
~ cat /etc/passwd | grep "false\|nologin" | cut -d":" -f1
daemon
bin
sys
games
man
lp
```

```bash
~ cat /etc/passwd | grep -v "false\|nologin" | tr ":" " "
root x 0 0 root /root /bin/bash
sync x 4 65534 sync /bin /bin/sync
mrb3n x 1000 1000 mrb3n /home/mrb3n /bin/bash
```

Hexa to ASCII
xxd -ps -r

7z l data.gzip # Sirve para ver cual archivo se va a descomprimir
7z x data.gzip # universal

Para listar procesos
ps aux

Tricks
Ctrl + r = history | grep ...
Ctrl + w = open tab
Ctrl + l = clear tab
Ctrl + a/e = Start/end of a string
Ctrl + k/u = k delete to selected, delete all
Ctrl + y = erase deleted
Ctrl + D = less /etc/pass move to the end

chmod +x file
-x execute
-r read
-w write

Para listar los servicios en escucha del sistema en todas las interfaces.
ss -l -4 | grep 'LISTEN'
netstat -ln4 | grep 'LISTEN'

Para obtener urls
```bash
curl -s https://www.inlanefreight.com | grep -Po "(?<=[\"\'])https:\/\/www\.inlanefreight\.com\/.*?(?=[\"\'])"
```

#### Filtrar



### Security
One of the Linux operating systems' most important security measures is keeping the OS and installed packages up to date. This can be achieved with a command such as:

`~ apt update && apt dist-upgrade`
