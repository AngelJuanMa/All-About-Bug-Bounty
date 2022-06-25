# OWASP Top 10 - 2021

## 1 - Broken Access Control

Restrictions on what authenticated users can do do not apply
correctly. Attackers can exploit these flaws to gain access, not
authorized, to functionalities and/or data, accounts of other users, view sensitive files,
modify data, change access rights and permissions, etc.

#### Parameter Manipulation
```http
POST /store/buy HTTP/1.1
price=-15
```

#### Direct Function Calling
* "admin": false to true
```http
POST /admin/data?admin=false HTTP/1.1
```
#### Insecure direct object references
*  - ?file=3.txt change to 2.txt
```http
POST /patientImage?file=3.txt HTTP/1.1
```

#### Static Pages & "Forceful browsing"
```http
GET /admin/viewTranscations HTTP/1.1
------------------------------------
GET /ADMIN/viewTranscations HTTP/1.1
```

#### Local File Inclusion & Path Traversal
```http
GET /view?pg=termsandservices HTTP/1.1
------------------------------------
GET /view?pg=../../../../etc/passwd%00 HTTP/1.1
```

#### Hash Based IDOR
IDOR function values can take many forms. String based, hashed, encoded, etc.
Example: MD5, SHA1, JWT, Base64.

#### Request Methods
When trying to exercise a function pay close attention to what HTTP method is used.
Many REST APIs use PUT or PATCH.

* Metadata manipulation, such as replaying or tampering with a JSON Web Token (JWT) access control token, or a cookie or hidden field manipulated to elevate privileges or abusing JWT invalidation.
https://jwt.io/
* Replace cookies or Authorization and remove credentials.  
* "roleid":1 to 2 or 0
* X-Original-URL: /invalid = not found - X-Original-URL: /admin-panel

#### Burp suite Extensions:
* AuthMatrix
* Authz
* Authorize
* AutoRepeater


## 2 - Cryptographic Failures

Many web applications and APIs do not adequately protect sensitive data, such as
financial, health, or Personally Identifiable Information (PII). the attackers
may steal or modify this inadequately protected data to carry out fraud
with credit cards, identity theft or other crimes. Sensitive data requires methods
additional protection, such as encryption in storage and transit.

* Are deprecated hash functions such as MD5 or SHA1 in use, or are non-cryptographic hash functions used when cryptographic hash functions are needed?

* Is randomness used for cryptographic purposes that was not designed to meet cryptographic requirements? Even if the correct function is chosen, does it need to be seeded by the developer, and if not, has the developer over-written the strong seeding functionality built into it with a seed that lacks sufficient entropy/unpredictability? - SALT


1) Change value of params: string to number, boolean, etc.
2) /cgi-bin/phpinfo.php
3) /robots.txt + Dirsearch fuzzing backups.
4) Google dorks: EJP: ext:bak ext:sql ext:txt, https://pentest-tools.com/.
5) TRACE method enabled, example: 400 status or /admin - exposing header X-Custom-IP-Authorization
6) /.git + site:github.com inurl:$domain.com

## 3 - Injection

Some of the more common injections are SQL, NoSQL, OS command, Object Relational Mapping (ORM), LDAP, and Expression Language (EL) or Object Graph Navigation Library (OGNL) injection. The concept is identical among all interpreters. Source code review is the best method of detecting if applications are vulnerable to injections. Automated testing of all parameters, headers, URL, cookies, JSON, SOAP, and XML data inputs is strongly encouraged. Organizations can include static (SAST), dynamic (DAST), and interactive (IAST) application security testing tools into the CI/CD pipeline to identify introduced injection flaws before production deployment.

1) Manual: Always add ?url=' or email=test@example.com'&pass=123'.
2) Manual: In intruder add sqli.txt.
3) Manual: Test cookies, referrer and User-Agent.
4) Automation: Use "sqlmap" every params, for GET requests.
5) Automation: Use sqlmap -r request.txt, for POST and PUT requests.

## 4 - Insecure Design 

Secure Design is a culture and methodology that constantly assesses threats and ensures code is robustly designed and tested to prevent known attack methods. Threat modeling should be integrated into training sessions (or similar activities); look for changes to data flows and access control or other security controls. In the development of the user story, determine the correct flow and failure states, ensure that they are well understood and accepted by the responsible and impacted parties. Analyze assumptions and conditions for expected and fault flows, ensure they remain accurate and desirable. Determine how to validate assumptions and enforce the necessary conditions for appropriate behaviors. Make sure the results are documented in the user story. Learn from mistakes and offer positive incentives to promote improvements. Secure Design is not a plugin or tool that you can add to the software.

## 5 - Security Misconfiguration

Incorrect security configuration is a very common problem and is due in part to
set the configuration manually, ad hoc or by default (or directly due to the lack of
setting). Examples are: open S3 buckets, misconfigured HTTP headers, messages
error with sensitive content, lack of patches and updates, frameworks, dependencies and
outdated components, etc.

* The security settings in the application servers, application frameworks (e.g., Struts, Spring, ASP.NET), libraries, databases, etc., are not set to secure values.
* Unnecessary features are enabled or installed (e.g., unnecessary ports, services, pages, accounts, or privileges).
* S3 Buckets: Open Read, Open Upload.
* Open source - Search in github for default credentials.
* Detailed errors, test with other inputs example: /?status=1 to /?status="one".

## 6 - Vulnerable and Outdated Components

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

## 7 - Identification and Authentication Failures 

The functions of the application related to authentication and session management are
implemented incorrectly, allowing attackers to compromise users and
passwords, session tokens, or exploit other implementation flaws to assume the
identity of other users (temporarily or permanently).

* Permits automated attacks such as credential stuffing, where the attacker has a list of valid usernames and passwords.
* Permits brute force or other automated attacks.
* Permits default, weak, or well-known passwords, such as "Password1" or "admin/admin".
* Uses weak or ineffective credential recovery and forgot-password processes, such as "knowledge-based answers," which cannot be made safe.
* Has missing or ineffective multi-factor authentication.
* Does not correctly invalidate Session IDs. User sessions or authentication tokens (mainly single sign-on (SSO) tokens) aren't properly invalidated during logout or a period of inactivity.

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

## 8 - Software and Data Integrity Failures 

Attackers could upload their own updates to distribute and run on all installations.

* Use digital signatures or similar mechanisms to verify the software or data is from the expected source and has not been altered.
* Ensure libraries and dependencies, such as npm or Maven, are consuming trusted repositories. If you have a higher risk profile, consider hosting an internal known-good repository that's vetted.
* Ensure that there is a review process for code and configuration changes to minimize the chance that malicious code or configuration could be introduced into your software pipeline.

## 9 - Security Logging and Monitoring Failures 

Insufficient logging and monitoring, coupled with a lack of incident response, allow
attackers sustain the attack over time, pivot to other systems and manipulate, extract or
destroy data. Studies show that the detection time of a security breach is
greater than 200 days, typically being detected by third parties rather than internal processes.

> To know what to do and what is happening in the case of an attack.
* .log with = STATUS, IP, user, date and path.
* .log = 200 OK 49.99.13.16 user123 2019-03-21T21:07:35 /login

## 10 - Server-Side Request Forgery (SSRF)

Server-side template injection is when an attacker can use native template syntax to inject a malicious payload into a template, which is then executed on the server side.

Template engines are designed to generate web pages by combining fixed templates with volatile data. Server-side template injection attacks can occur when user input is concatenated directly into a template, rather than being passed as data. This allows attackers to inject arbitrary template directives to manipulate the template engine, often allowing them to take complete control of the server. As the name suggests, server-side template injection payloads are delivered and evaluated on the server side, potentially making them much more dangerous than a typical client-side template injection.

Detect: ${{<%[%'"}}%\

![SSRF](https://miro.medium.com/max/1150/1*lJeETY2P1UuQYqFahbzPFA.png)

### References:
* https://owasp.org/Top10/
* https://wiki.owasp.org/images/5/5e/OWASP-Top-10-2017-es.pdf
