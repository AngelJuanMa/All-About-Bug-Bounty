# Methodology
> Ángel

# Recon
1) Enumerate all Domains.
2) Enumerate Subdomains: Use recon.sh + httpx or Knockpy -w subdomains $domain.com.
3) Enumerate Params: gau, waybackurls and paramspider.
4) Enumerate ports of each subdomain: nmap.

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

### API Tokens:
1) pk_live
2) sk_live
3) AIza

### Encrypted JWT
Eyj

# OWASP 10 - 2017
##### TIP: Always test every params

## 1 - Injection

1) Manual: Always add ?url=' or email=test@example.com'&pass=123'.
2) Manual: In intruder add sqli.txt.
3) Manual: Test cookies, referrer and User-Agent.
4) Automation: Use "sqlmap" every params, for GET requests.
5) Automation: Use sqlmap -r request.txt, for POST and PUT requests.

## 2 - Broken Authentication

1) Username enumeration via different responses
2) Enumeration error: "Incorrect password", "Invalid username" and "Invalid email".
3) Ultimited requests + Weak password 
4) Request limit bypass via headers:
* X-Originating-IP: 127.0.0.1
* X-Forwarded-For: 127.0.0.1
* X-Remote-IP: 127.0.0.1
* X-Remote-Addr: 127.0.0.1
* X-Client-IP: 127.0.0.1
* X-Host: 127.0.0.1
* X-Forwared-Host: 127.0.0.1

## 3 - Sensitive Data Exposure
## 4 - XML External Entities (XXE)
## 5 - Broken Access Control
## 6 - Security Misconfiguration
## 7 - Cross-Site Scripting (XSS)
* Upgrade-Insecure-Requests: 1
## 8 - Insecure Deserialization
## 9 - Using Components with Known Vulnerabilities
## 10 - Insufficient Logging & Monitoring

# CWE/SANS TOP 25 Most Dangerous Software Errors
## 1	CWE-119	Improper Restriction of Operations within the Bounds of a Memory Buffer
## 2	CWE-79	Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')
## 3	CWE-20	Improper Input Validation
## 4	CWE-200	Information Exposure
## 5	CWE-125	Out-of-bounds Read
## 6	CWE-89	Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')
## 7	CWE-416	Use After Free
## 8	CWE-190	Integer Overflow or Wraparound
## 9	CWE-352	Cross-Site Request Forgery (CSRF)
## 10	CWE-22	Improper Limitation of a Pathname to a Restricted Directory ('Path Traversal')
## 11	CWE-78	Improper Neutralization of Special Elements used in an OS Command ('OS Command Injection')
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

# Buffer Overflow
