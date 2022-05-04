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

