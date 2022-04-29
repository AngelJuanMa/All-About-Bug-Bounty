# Wordlist by @TomNomNom

https://tomnomnom.com/talks/wwwww.pdf

## Where can they be used?

* Subdomain enumeration
* Path guessing
* Authenticaction guessing
* API method guessing
* Parameter guessing
* Header guessing
* ...you get the point

## Pre-baked lists

https://github.com/danielmiessler/SecLists

https://github.com/google/fuzzing/tree/master/dictionaries

https://crackstation.net/crackstation-wordlist-password-cracking-dictionary.htm

## Finding words unique to a target

```bash
gau example.net | ./unfurl -u keys | sed 's#/#\n#g' | sort -u | example-words
gau example.net | xargs -I@ sh -c  "curl @ | ./tok | tr '[:upper:]' '[:lower:]' | sort -u | anew example-words" 
```

### Reference

https://github.com/tomnomnom/hacks/tree/master/tok

https://tomnomnom.com/talks/wwwww.pdf

https://www.youtube.com/watch?v=W4_QCSIujQ4&list=WL&index=6
