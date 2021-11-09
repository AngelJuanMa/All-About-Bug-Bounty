<h1>Open Redirects</h1>
<p>Primero obtener las redirecciones conocidas y guardarlas en un archivo, Ejp: alreadytested.txt</p>
<code>$ cat domains.txt | xargs -I@ sh -c "python3 orhunter.py -t 100 --deepcrawl -s -d @ | grep '@' | anew alreadytested.txt"</code>
<hr>
<p>Una vez recolectado redirecciones muy posiblemente ya reportadas, alertaremos las que son nuevas mediante discord.</p>
<code>$ cat domains.txt | xargs -I@ sh -c "python3 orhunter.py -t 100 --deepcrawl -s -d @ | grep '@' | anew alreadytested.txt | notify -provider-config provider-config.yaml"</code>

Referencias:
https://github.com/PushpenderIndia/ORhunter
https://github.com/projectdiscovery/notify
