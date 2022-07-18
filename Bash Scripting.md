# Bash Scripting

IF on single line

`if [[ 5 > 3 ]]; then echo "🆗"; elif echo "❔" ; else echo "❌";fi`

`[[ 5 > 3 ]] && echo "🆗" || echo "❌"`

IF on multi lines

```bash
#!/bin/bash

if [[ $1 > 5 ]]; then
    echo "🆗"
elif (( $1 == 5 )); then
    echo "❔"
else
    echo "❌"
fi
```

While on single line

`while sleep 2; do echo thinking; done`

While on multiple line

```bash
#!/bin/bash

while sleep 2
do
        echo thinking
done
```

While Read File on single line

`while read line; do echo $line; done < company.txt`

While Read File on multiple line

```bash
#!/bin/bash
filename='company.txt'
n=1
while read line; 
do
    echo "Line No. $n : $line"
    n=$((n+1))
done < $filename
```
