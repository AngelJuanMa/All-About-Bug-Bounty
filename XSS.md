# Cross-site scripting - XSS
> Manipulating a vulnerable web site so that it returns malicious JavaScript to users. When the malicious code executes inside a victim's browser, the attacker can fully compromise their interaction with the application. 

### XSS proof of concept
* alert(document.domain)
* alert(document.cookie)
* print(): From version 92 onward (July 20th, 2021), cross-origin iframes are prevented from calling alert(). an alternative PoC payload recommend is print().

### What can XSS be used for?
* Carry out any action that the user is able to perform.
* Read any data that the user is able to access. 
* Capture the user's login credentials. 
* Add html and tracker to steal credentials.

## Reflected
> Where the malicious script comes from the current HTTP request. 
#### Testing manually involves the following steps: 
* Test every entry point.
> Test separately every entry point for data within the application's HTTP requests. This includes parameters or other data within the URL query string and message body, and the URL file path. It also includes HTTP headers.
* Submit random alphanumeric values.
> For each entry point, submit a unique random value and determine whether the value is reflected in the response.
* Determine the reflection context.
> For each location within the response where the random value is reflected, determine its context. This might be in text between HTML tags, within a tag attribute which might be quoted, within a JavaScript string, etc. 
* Test alternative payloads
> If the candidate XSS payload was modified by the application, or blocked.
## Stored
> Where the malicious script comes from the website's database.
## DOM-based
> Where the vulnerability exists in client-side code rather than server-side code. 
## Blind
> Is a variant of persistent XSS vulnerabilities, this is not reflected.
To detect use: https://xsshunter.com

## Self XSS
> It cannot be triggered in normal ways
Case exploitable: If some input in profile is vulnerable but only accesible for the creator, try unlogin the user and login normally doesn't have csrf protection or oauth login method.

### Search for:
1) setRequestHeader
2) XMLHttpRequest
3) $.ajax 
4) $.get 
5) $.post 
6) $.getJSON 
7) fetch( 
8) axios({ 
9) Url = "http

### How to prevent XSS attacks
1) Filter input on arrival.
2) Encode data on output.
3) Use appropriate response headers.
4) Content Security Policy.

##### Directive will only allow scripts to be loaded from the same origin as the page itself:
* *script-src 'self'*
* *script-src https://scripts.normal-website.com*
* *img-src 'self'*
* *img-src https://images.normal-website.com*
* *frame-ancestors 'self'*
* *frame-ancestors 'none'*
* *frame-ancestors 'self' https://normal-website.com https://*.robust-website.com*
* *X-Frame-Options*
* *Content-Type*
* *X-Content-Type*

### CSP Bypass
Normally, it's not possible to overwrite an existing script-src directive. However, Chrome recently introduced the script-src-elem directive, which allows you to control script elements, but not events. Crucially, this new directive allows you to overwrite existing script-src directives.
* ``http
https://example.com/?search=<script>alert(1)</script>&token=;script-src-elem 'unsafe-inline'
``

### CheatSheet
https://portswigger.net/web-security/cross-site-scripting/cheat-sheet
https://github.com/AngelJuanMa/Pentesting/blob/main/Payloads/XSS.txt
