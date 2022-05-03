# API

## Improper Assets Management

```http
POST /api/v4/validate-code HTTP/1.1

{"token": "2444"}

----------------º-------------------

HTTP/1.1 401 Unauthorized
{
"remaining_attempt": 4,
"message": "The supplied token is invalid"
}
```

**Invalidating brute force attacks**

```http
POST /api/v1/validate-code HTTP/1.1

{token: '4444'}

----------------º-------------------

HTTP/1.1 401 Unauthorized

{"message":"The supplied token is invalid"}
```

## Reference:

https://application.security/free-application-security-training/owasp-top-10-api-improper-assets-management
