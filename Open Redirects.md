<h1>Open Redirects</h1>
<p>Primero obtener las redirecciones conocidas</p>
<code>$ cat domains.txt | xargs -I@ sh -c "python3 orhunter.py -t 100 --deepcrawl -s -d @ | grep '@' | anew alreadytested.txt"</code>
