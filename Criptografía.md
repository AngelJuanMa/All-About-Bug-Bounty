# Criptografía Informática

> En la informática, la criptografía se refiere a la técnica de códigos y sistemas de escritura cifrada para proteger la trasmisión de información privada, de forma que para quien no posea la clave sea ilegible o prácticamente imposible de descifrar.

* Mensaje en claro
* Mensaje Cifrado, Criptograma
* Cifrar y Descifrar
* Criptoanalisis
* Cifrar vs Codificar vs Hash
* Comunicación segura

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

## Tecnicas
La criptografia se basa en 2 tecnicas
#### Permutación
Se encarga de cambiar el orden de los mensajes
#### Sustitución
Se encarga de sustitituir estos elementos por otros relacionados.


Cifrar - Variable
Codificar - Fijo

# Simetrica
Utiliza la misma clave para cifrar que para decifrar

* Con la misma llave segura compartida por un canal seguro
* El emisor encriptara su mensaje en claro con correspondiente llave segura, y este pasara el criptograma por un canal inseguro al Receptor
* El Receptor recibe el criptograma y lo desigra con la correspondiente llave segura.

### Cifrado por Bloque
Segmentar el mensaje por bloques: palabras, bits, información. Cifrarlo toda la información, y luego juntarlos en un bloque único. 
### Cifrado de Flujo
Se cifran bit a bit, información a información.

# Asimetrica
Utilizan una clave para cifrar y una clave distinta para decifrar.
#### Clave pública:
Es conocido por todos
#### Clave privada:
Clave secreta y unica, irepetible para cada persona.

## Cifrado
Si se cifra con la clave publica del receptor sera decifrada con la clave privada y viceversa.

* RSA
* ELGAMAL
* Curvas Elipticas

### Diferencias
Problemas de computación, tardando mas en cifrar.
De Asimetrica a Simetrica
* Mayor tiempo de proceso
* Mayor tiempo de cifrado
* Mayor tamaño hasta x5 veces.

# Hash
A diferencia del cifrado no tiene clave. No es conciderado un algoritmo de cifrado.
Los hash siempre son unicos y irepetibles, cambiando un solo bit del archivo original el hash tiene que cambiar la mitad
* SHA256 -> 256 Caracteres
* SHA512 -> 512 Caracteres
Sirve para Firma digital, almacenar las contraseñas en la Base De Datos:
Para que los ciberdelincuentes no puedan haceder a las contraseñas
y para que los administradores de la BD tampoco puedan.

# Firma Digital
Proceso donde el receptor puede validar la identidad o el origen de un mensaje del emisor.
Ofrese: No repudio y Autenticación
Se basa en la criptografia de clave asimetrica
Utiliza el hash
