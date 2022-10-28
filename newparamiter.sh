# Obtener nuevos parametros y directorios
# Requisitos: paramiter.sh, gau y anew

while read i; do
gau $i > gau.log
cat gau.log | qsreplace FUZZ | sort -u | grep -v "\.png" | grep -v "\.css" | grep -v "\.eot" | grep -v "\.woff" | grep -v "\.ttf" | grep -v "\.jpg" | grep -v "\.svg" | grep -v '\.xml' | grep -v '\.pdf' | grep -v '\.gif' | grep -v '\.js' > gau.filtered.log
cat gau.filtered.log | sort -u | awk '{print $2}' FS=? | sort -u | grep -v '%' | sed -e ':a' -e 'N' -e '$!ba' -e 's/&/\n/g' | sort -u | ./go/bin/anew ./output/parametros.$i.txt > newParametros
cat gau.filtered.log | sort -u | awk '{print $1}' FS=? | sort -u | ./go/bin/anew ./output/directorios.$i.txt > newParametros
rm gau.log
rm gau.filtered.log
done < domains
