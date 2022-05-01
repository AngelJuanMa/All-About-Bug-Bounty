# NMAP

### Scan start example
```bash
nmap -p- --open -T5 -v -n 10.10.10.10
```

-p-: 65536 ports

--open: Nothing on TCP? then oops

-v: show ports while scanning

-T5: Faster

-n: Do not apply dns resolution

### Another faster example
```bash
nmap -p- -sS --min-rate 5000 --open -vvv -n -Pn 10.10.10.10 -oG all ports
```

-oG: Export writable

### Get versions on ports

```bash
nmap -sCV -p... 10.10.10.10 on target
```

...: ports to scan

-sCV: Get version and service

-oN: nmap export format
