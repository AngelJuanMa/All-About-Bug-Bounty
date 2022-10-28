# Obtener todos los parametros y directorios por medio de gau
# Requisitos: gau, crear un archivo llamado "domains" y poner por cada linea los dominios a analizar
mkdir output
mkdir output/scan

while read i; do
gau $i | grep $i > gau.log
cat gau.log | qsreplace FUZZ | sort -u | grep -v "\.png" | grep -v "\.css" | grep -v "\.eot" | grep -v "\.woff" | grep -v "\.ttf" | grep -v "\.jpg" | grep -v "\.svg" | grep -v '\.xml' | grep -v '\.pdf' | grep -v '\.gif' | grep -v '\.js' > gau.filtered.log
cat gau.filtered.log | awk '{print $2}' FS=? | grep -v '%' | sed -e ':a' -e 'N' -e '$!ba' -e 's/&/\n/g' | sort -u > ./output/parametros.$i.txt
cat gau.filtered.log | awk '{print $1}' FS=? | sort -u > ./output/directorios.$i.txt
cat ./output/parametros.$i.txt | xargs -I@ sh -c "cat ./output/directorios.$i.txt | xargs -I% sh -c 'echo %?@'" | grep '?' | sort -u > ./scan/all.$i.scan
rm gau.log
rm gau.filtered.log
done < domains
