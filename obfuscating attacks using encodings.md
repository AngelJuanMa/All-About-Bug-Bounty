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

```http2
<img src=x onerror="alert(1)">
```

```http2
<img src=x onerror="&#x61;lert(1)">
```

### Leading zeros

#### References:

https://portswigger.net/web-security/reference/obfuscating-attacks-using-encodings

https://subscription.packtpub.com/book/networking-and-servers/9781785284588/1/ch01lvl1sec11/double-encoding
