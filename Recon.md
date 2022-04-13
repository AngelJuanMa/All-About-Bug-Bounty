# Recon
1) Enumerate Domains.
2) Enumerate Subdomains: recon.sh + httpx or Knockpy -w subdomains $domain.com.
3) Enumerate Params: gau, waybackurls, paramspider and dirsearch.
4) Enumerate ports of each subdomain: nmap.
5) API KEYS - cat url.txt | grep "\.js" xargs -I@ sh -c 'python.exe SecretFinder.py -i @ -e -o cli' | tee apiKeys.txt
6) Maltego + FOCA.
7) Google Dorks.
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

### API Tokens:
1) pk_live
2) sk_live
3) AIza
