#Pre-Install tools
sudo apt-get update
sudo apt install golang-go
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Get subdomains
cat domains.txt | xargs -I@ sh -c  "subfinder -d @ | grep '.@' | tee subfinder.txt"
cat domains.txt | xargs -I@ sh -c  "findomain-windows.exe -t @ | grep '.@' | tee findomain.txt"
cat domains.txt | xargs -I@ sh -c  "assetfinder @ | grep '.@' | tee assetfinder.txt"
cat domains.txt | xargs -I@ sh -c  "python.exe sublist3r.py -d @ | grep '.@' | tee subdomains.txt"

cat subfinder.txt | anew findomain.txt
cat findomain.txt | anew assetfinder.txt
cat assetfinder.txt | anew subdomains.txt
cat subdomains.txt | qsreplace -a > subdomains.txt

rm subfinder.txt
rm findomain.txt
rm assetfinder.txt
