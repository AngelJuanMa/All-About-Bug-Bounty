# API

## Improper Assets Management

```http
Request:
POST /api/v4/validate-code HTTP/1.1

{"token": "2444"}

Response:
HTTP/1.1 401 Unauthorized
{
"remaining_attempt": 4,
"message": "The supplied token is invalid"
}
```

**Invalidating brute force attacks**

```http
Request:
POST /api/v1/validate-code HTTP/1.1

{token: '4444'}

Response:
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

## Broken Object Level Authorization

```http
GET /api/users/4673921/orders HTTP/1.1

4673921 -> 4675431 another user

GET /api/users/4675431/orders HTTP/1.1
```

## Broken User Authentication

```http
Request:
POST /api/v1/validate-code HTTP/1.1

{token: '4444'}

Response:
HTTP/1.1 401 Unauthorized

{"message":"The supplied token is invalid"}
```

without invalidating brute force attacks

## Lack of Resources & Rate Limiting

 User Enumeration vulnerability in CarVibe's driver registration feature
 
 The **phone number** already exists. Please log in to continue.

## Broken Function Level Authorization

```http
GET /api/users/533 HTTP/1.1
```

```http
DELETE /api/users/532 HTTP/1.1
```

## Mass Assignment

```http
POST /api/reset-password HTTP/1.1

{
"password": "test",
"isadmin": false
}
```

## Insufficient Logging & Monitoring

In order to effectively mitigate against Insufficient Logging & Monitoring issues, developers must follow the following logging best practices:

* Ensure all login, access control failures, and server-side input validation failures can be logged with sufficient user context to identify suspicious or malicious accounts, and held for sufficient time to allow delayed forensic analysis.
* Ensure that logs are generated in a format that can be easily consumed by centralized log management solutions.
* Ensure sensitive actions have an audit trail with integrity controls to prevent tampering or deletion, such as append-only database tables or similar.
* Establish effective monitoring and alerting such that suspicious activities are detected and responded to in a timely fashion.


## Reference:

https://application.security/free-application-security-training/owasp-top-10-api-improper-assets-management
