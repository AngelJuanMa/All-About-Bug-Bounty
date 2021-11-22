<h1>Open Redirects</h1>
<h3 style="color:red;">Impact:</h3>

Example page: https://public-firing-range.appspot.com/redirect/
case 1:
/parameter?url=/ change / to https://evil.com
case 2:
/parameter/NOSTARTSWITHJS?url=evil.com redirects to https://public-firing-range.appspot.com/redirect/parameter/evil.com so test //evil.com or https://evil.com</p>
case 3:
/meta?q=/
notar que este no aparenta ser una redirreción, asi que se debe testear todos los parametros.
<p>Since the domain name in a URL is typically the only indicator for a user to recognize a legitimate website from a non-legitimate one, an attacker can abuse this trust to exploit an open redirect vulnerability on the vulnerable website and redirect the user to a malicious site.</p>
<h2>Bug Bounty</h2>
<p>First: Get urls with open redirect and false positive, already tested by other bug bounty hunters and anew to, Ejp: alreadytested.txt</p>
<code>$ cat domains.txt | xargs -I@ sh -c "python3 orhunter.py -t 100 --deepcrawl -s -d @ | grep '@' | anew alreadytested.txt"</code>
<hr>
<p>Second: Notify to discord, new open redirects.</p>
<code>$ cat domains.txt | xargs -I@ sh -c "python3 orhunter.py -t 100 --deepcrawl -s -d @ | grep '@' | anew alreadytested.txt | notify -provider-config provider-config.yaml"</code>
<hr>
<p>References:</p>
<p>https://github.com/PushpenderIndia/ORhunter</p>
<p>https://github.com/projectdiscovery/notify</p>
