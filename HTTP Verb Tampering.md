## HTTP Verb Tampering
```http2
OPTIONS
GET
HEAD
POST
PUT
DELETE
TRACE
CONNECT
```
If enabled, the Web Distributed Authoring and Version (WebDAV) extensions permit several more HTTP methods:
```http2
PROPFIND
PROPPATCH
MKCOL
COPY
MOVE
LOCK
UNLOCK
```
Options Method
```
OPTIONS / HTTP/1.1
Host: www.victim.com

HTTP/1.1 200 OK
Server: Microsoft-IIS/5.0
Date: Tue, 31 Oct 2006 08:00:29 GMT
Connection: close
Allow: GET, HEAD, POST, TRACE, OPTIONS
Content-Length: 0
```
Manual
```bash
[METHOD] /[index.htm] HTTP/1.1
host: [www.example.com]

OPTIONS /index.html HTTP/1.1
host: www.example.com
```
Automation
```bash
#!/bin/bash

for webservmethod in GET POST PUT TRACE CONNECT OPTIONS PROPFIND;

do
printf "$webservmethod " ;
printf "$webservmethod / HTTP/1.1\nHost: $1\n\n" | nc -q 1 $1 80 | grep "HTTP/1>

done
