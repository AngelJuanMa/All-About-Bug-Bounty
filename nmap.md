 # NMAP

### Example start scanning
```bash
nmap -p- --open -T5 -v -n 10.10.10.10
```

-p-: 65536 ports

--open: Nothing on TCP? then udp

-v: show ports while scanning

-T5: Faster

-n: Do not apply dns resolution
