# Criptografía Informática

> En la informática, la criptografía se refiere a la técnica de códigos y sistemas de escritura cifrada para proteger la trasmisión de información privada, de forma que para quien no posea la clave sea ilegible o prácticamente imposible de descifrar.

- [Conceptos](#conceptos)
  - [Mensaje en claro](#mensaje-en-claro)
  - [Mensaje Cifrado, Criptograma](#mensaje-cifrado-criptograma)
  - [Cifrar y Descifrar](#cifrar-y-descifrar)
  - [Criptoanalisis](#criptoanalisis)
  - [Cifrar vs Codificar vs Hash](#Cifrar-vs-Codificar-vs-Hash)
- [Comunicación segùra](#comunicación-segura)
  - [Confidencialidad](#confidencialidad)
  - [Autenticación](#autenticación)
  - [Integridad](#integridad)
  - [No repudio](#no-repudio)
  - [Acceso y disponibilidad](#acceso-y-disponibilidad)
- [Técnicas](#técnicas)
  - [Permutación](#permutación)
  - [Sustitución](#sustitución)
- [Simétrica](#simétrica)
  - [Cifrado por Bloque](#cifrado-por-bloque)
  - [Cifrado por Flujo](#cifrado-por-flujo)
- [Asimétrica](#asimétrica)
  - [Cifrado por Bloque](#cifrado-por-Bloque)
  - [Cifrado por Flujo](#cifrado-por-flujo)
- [Cifrado](#cifrado)
  - [RSA](#rsa)
  - [ELGAMAL](#elgamal)
  - [Curvas Elípticas](#curvas-elípticas)
- [Diferencias](#diferencias) 
- [Hash](#hash) 
- [Firma Digital](#firma-digital) 

## Conceptos

#### Mensaje en claro
Información no cifrada, es legible.
#### Mensaje Cifrado, Criptograma
Mensaje en claro cifrado, con algunos determinados algoritmos.
#### Cifrar y Descifrar
Cifrar: Proceso de pasar de un mensaje en claro a criptograma.
Descifrado: Proceso de pasar de un criptograma a mensaje en claro.
#### Criptoanalisis
Es el estudio de romper un cifrado para obtener el mensaje en claro.

## Comunicación Segura
#### Confidencialidad
El emisor y el receptor son los únicos que conocen el contenido del mensaje.
> Evitar la perdida de información
#### Autenticación
El emisor y el receptor deben conocer la identidad del otro.
> Evitar la suplantación de identidad
#### Integridad
Asegura que el mensaje no ha sido alterado
> Evitar que un mensaje sea alterado
#### No repudio: 
Si el receptor no confía de un mensaje recibido y por la fuente o persona que lo envía este puede rechazar el mensaje.
> Estar seguro de que ocurra la cantidad de veces que tenga que ocurrir. Para evitar DOS
#### Acceso y disponibilidad 
Tiene que estar disponible en todo momento
> Evitar la denegación de servicios

## Técnicas
La criptografía se basa en 2 técnicas
#### Permutación
Se encarga de cambiar el orden de los mensajes
#### Sustitución
Se encarga de sustituir estos elementos por otros relacionados.


Cifrar - Variable
Codificar - Fijo

# SALT
1) Appends a random string to the input before hashing.
2) Used to make a hash harder to guess

Users often to use weak passwords, like “password123”. When a database is compromised, the attacker can easily find the value of an unsalted hash by searching precomputed rainbow table of common hashes - salting fixes this.

# Simétrica
Utiliza una clave simétrica para cifrar y para descifrar.

* The same input will produce a different output, unlike hashes.
* Encrypted message can be reversed with the key.
* Same key used to encrypt and decrypt message.

#### MD5: Deprecated by nist

1) Con la misma llave segura compartida por un canal seguro
2) El emisor encriptara su mensaje en claro con correspondiente llave segura, y este pasara el criptograma por un canal inseguro al Receptor.
3) El Receptor recibe el criptograma y lo desencripta con dicha clave simetrica que viaja por el canal seguro.

### Problemas

1) Por donde enviamos la clave simétrica, ya que el "canal seguro" no siempre es realemente seguro.
2) No consigue el no repudio en origen: siendo que si un atacante tiene la misma clave simetrica este puede enviar mensages.
3) No hay firma digital.

### Cifrado por Bloque
Segmentar el mensaje por bloques: palabras, bits, información. Cifrarlo toda la información, y luego juntarlos en un bloque único.
1) Rondas: número de veces que se repite una operación sobre cada bloque.
2) Mezcla con XOR: algunos datos se mezclaran con otros usando la función binaria del "OR exclusivo". A y B será cierto cuando A y B no sean iguales.
3) Cifrado te tipo Feistels: Esquemas que dividen en bloques y aplican uno o más esquemas a cada bloque (ej DES).
4) Cifrado te tipo no Feistels: Utilizan sub-claves y distintas rondas de cifrado por cada bloque (ej AES).

1, 3 => xor => C(x, k) => 2,1 => xor => C(x, k)

Modo ECB:
- Se aplica a cada bloque del texto plano el mismo cifrado de forma independiente.
- Si el texto plano tiene bloques iguales debilitara el cifrado ya que habrá repeticiones en el texto cifrado.

#### DES (Data Encryption Standard)
Descontinuado proponer este algoritmo, roto entre los 80s y 90s.

#### AES (
 
Key sizes: 128, 192, 256 bits.
Block size: 128 bits.

1) Todos los procesos deben ser reversibles.
2) 10 Rondas
3) El output es de 16 bytes, 128 bits
4) Tiene 11 llaves 16 bytes = Total 176 bytes
 
#### Esquema de relleno:
- El tamaño de los datos puede no ser múltiplo del tamaño de bloque, así que suele ser necesario rellenar un bloque con datos que no debiliten el cifrado.

### Cifrado de Flujo
Se cifran bit a bit, información a información.

# Asimétrica
Utilizan una clave para cifrar y una clave distinta para descifrar.

"Llavero de claves públicas": Proporcionan y validan las claves públicas por autoridades de certificacion autorizadas, debido al ataque Man In The Middle.

#### Clave pública:
Es conocido por todos
#### Clave privada:
Clave secreta y uníca, irrepetible para cada persona.

#### Aplicación:
* Cifrado y descifrado: Confidencialidad
* Firma digital: No repudio en origen, integridad y autenticación

## Cifrado
Si se cifra con la clave publica del receptor sera descifrada con la clave privada y viceversa.

* RSA:
La seguridad de RSA se basa en la dificultad práctica de factorizar el producto de dos grandes números primos, el "problema de factorización".
`Is getting really slow with increasing key size. This is why many providers are switching to elliptic curve cryptography ^^ That is way faster and needs smaller keys.`

Seguridad media-baja: 512 bits.
Seguridad media-alta: 1024 bits.
Seguridad muy alta: 2048 bits.

Puede ser utilizado para generar las llaves públicas y privadas.

1) Vulnerable a compudoras cuanticas

* ELGAMAL

* Curvas Elípticas
#### Pros:
1) Compatibles con la mayoria de los sistemas operativos y web modernos.
2) Las claves son mas pequeñas, lo que significa un mejor rendimiento.
3) Es menos vulnerable a la computacidoras cuanticas.

#### Contras:
1) Aumenta el tamaño del criptograma.
2) Es mas dificil de implementar generando errores de seguridad.
3) Es computacionalmente mas costosa que el cifrado de clave privada.

### Diferencias
Problemas de computación, tardando más en cifrar.
De Asimétrica a Simétrica
* Mayor tiempo de proceso
* Mayor tiempo de cifrado
* Mayor tamaño hasta x5 veces.

# Hash
> Same input -> Hashing Function -> Same output, son irrebersibles
A diferencia del cifrado no tiene clave. No es considerado un algoritmo de cifrado.

Los hash siempre son únicos y irrepetibles, cambiando un solo bit del archivo original el hash tiene que cambiar la mitad.
* SHA256 -> 64 Caracteres, 256 Bits.
* SHA512 -> 128 Caracteres, 512 Bits.
Sirve para Firma digital, almacenar las contraseñas en la Base De Datos:
Para que los ciberdelincuentes y administradores de la BD, no puedan acceder a las contraseñas.

# Firma Digital
Una firma es el hash de un mensaje que luego se cifra con la clave privada del remitente.
La firma puede ser verificada por el destinatario utilizando la clave pública del remitente. Esto puede garantizar que el mensaje original sea auténtico y sin modificaciones.
Ofrece: No repudio y Autenticación.
Se basa en la criptografía de clave asimétrica.

#### Node Crypto
https://github.com/fireship-io/node-crypto-examples/tree/main/src
https://fireship.io/lessons/node-crypto-examples/

#### Crack
https://www.dcode.fr/cipher-identifier
https://crackstation.net/
https://gchq.github.io/CyberChef/#input=WUhBT0FOVVREU1lPRU9JRVVUVEMh
