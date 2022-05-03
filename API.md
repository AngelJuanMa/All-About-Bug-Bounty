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

## Excessive Data Exposure

#### Look for:

* Emails
* Passwords
* Tokens

#### Forgotten password

Analyzing the HTTP response, we can see that DesignDECK's /api/forgot-password API endpoint is returning more data than it should, including the password reset token d509c6f0-e8b2-4297-9a2f-54f842bc8412 and other sensitive information associated with Bob's DesignDECK account.

https://api.designdeck.com/reset-password?token=e611d7a1-f9c3-5308-0b3a-65a953cd9523

Token reset exposure.

## Reference:

https://application.security/free-application-security-training/owasp-top-10-api-improper-assets-management
