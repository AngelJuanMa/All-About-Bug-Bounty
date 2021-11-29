# Methodology
> Ángel

# Search for:

### Requests:
1) setRequestHeader
2) XMLHttpRequest
3) $.ajax 
4) $.get 
5) $.post 
6) $.getJSON 
7) fetch( 
8) axios({ 
9) Url = "http

### FIREBASE:
firebaseio.com/.json

### API Tokens:
1) pk_live
2) sk_live
3) AIza

### Encrypted JWT
Eyj

# OWASP 10 - 2017
##### TIP: Always test every params

## Injection

1) First test ?url='
2) Use "sqlmap" in every param
3) Use sqlmap -r request.txt

## Broken Authentication
1) Username enumeration via different responses
2) Enumeration error: "Incorrect password", "Invalid username" and "Invalid email".
3) Ultimited requests + Weak password 
4) Bypass request limit via IP:
    X-Originating-IP: 127.0.0.1
    X-Forwarded-For: 127.0.0.1
    X-Remote-IP: 127.0.0.1
    X-Remote-Addr: 127.0.0.1
    X-Client-IP: 127.0.0.1
    X-Host: 127.0.0.1
    X-Forwared-Host: 127.0.0.1
5)

## Sensitive Data Exposure
## XML External Entities (XXE)
## Broken Access Control
## Security Misconfiguration
## Cross-Site Scripting (XSS)
## Insecure Deserialization
## Using Components with Known Vulnerabilities
## Insufficient Logging & Monitoring
