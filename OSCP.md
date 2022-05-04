# OSCP

> Notes on hackthebox machines, for oscp preparation

#### Operation Systeam

```bash
ping -c 10.10.10.11
```

Linux (TTL -> 64) | Windows (TTL -> 128) 

#### Name Servers

```bash
dig @10.10.10.10 realcorp.htb ns
```

#### Mail Servers

```bash
dig @10.10.10.10 realcorp.htb ms
```

#### Zone Transfer Attack

```bash
dig @10.10.10.10 realcorp.htb axfr
```

#### Port Scanning

```bash
nmap -p- -sS --min-rate 5000 --open -vvv -n -Pn 10.10.10.10 -oG all ports
nmap -sCV -p{{ports}} 10.10.10.10 on target
```

#### Detect Services

```bash
whatweb http://10.10.10.11
```

#### Subdomains

```bash
gobuster vhost -u http://force.htb -w /seclist/Discovery/DNS/subdomains-top1million-5000.txt -r
```
