sublist3r -d $1 -e baidu,yahoo,google,bing,ask,netcracft,threatcrowd,ssl,passivedns -o .temp/sublist3r.txt
findomain -t $1 | sort -u | tee -a .temp/findomain.txt
assetfinder --subs-only $1 | tee -a .temp/assetfinder.txt
amass enum --passive -d $1 -o .temp/amass.txt
subfinder -d $1 -silent -all -o temp/subfinder.txt

cat .temp/*.txt | sort -u | grep -i <domain> | tee -a all.txt
cat all.txt | httpx -silent -ports 80,443,3000,8080,8000,8081,8008,8888,8443,9000,9001,9090 | tee -a alive.txt
