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

# C-like for loop
for ((i = 0 ; i < 100 ; i++)); do
  echo $i
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

Function

```bash
myfunc() {
    echo "hello $1"
}

# Same as above (alternate syntax)
function myfunc() {
    echo "hello $1"
}

myfunc "John"
```

Function with return

```bash
myfunc() {
    local myresult='some value'
    echo $myresult
}
result="$(myfunc)"
```

Arrays

```bash
Fruits=('Apple' 'Banana' 'Orange')
Fruits[0]="Apple"
Fruits[1]="Banana"
Fruits[2]="Orange"
```

$# 	Number of arguments

$* 	All positional arguments (as a single word)

$@ 	All positional arguments (as separate strings)

$1 	First argument

$_ 	Last argument of the previous command

## References

https://devhints.io/bash
