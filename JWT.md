JWT
Primera Parte: Header
Segunda Parte: Payload
Tercera Parte: Signature

```jwt
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.
eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.
SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
```


JWT vs JWS vs JWE

### Accepting arbitrary signatures

Cambiar el contenido de Payload

{
  "admin": true
}

### Accepting tokens with no signature

Cambiar alg a none.

{
  "alg": "none"
}

Y quitar la signature pero dejar un punto.

```jwt
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.
eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.
```
