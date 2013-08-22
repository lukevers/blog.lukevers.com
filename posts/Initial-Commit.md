---
Title: Initial Commit
Description: First blog post
Author: Luke Evers
Date: 2013-08-05 15:30
Lang: en
---

Hello! Since [Sasha](http://speedfulpanic.net) and [Dylan](http://dylwhich.com/) have both set up instances of the blogging engine [Trofaf](https://github.com/PuerkitoBio/trofaf), written in [Go](http://golang.org), I decided to also give it a *go*. You can read all about Trofaf on GitHub if you're so inclined.

### My Setup

I'm using Trofaf to generate my static site, and I'm using [Lighttpd](http://www.lighttpd.net/) as my webserver. I've been slowly considering using [Nginx](http://nginx.com/) instead of Lighttpd, but I have yet to migrate all my sites over.

I'm also using [Rainbow](http://craig.is/making/rainbows) for syntax highlighting! I've used [SyntaxHighlighter](http://alexgorbatchev.com/SyntaxHighlighter/) before, but I recently came across Rainbow and decided to give it a try! There are a ton of different styles to use, and you could even write your own style if you're so inclined to do so. I'm using a theme called [Github.css](https://github.com/ccampbell/rainbow/blob/master/themes/github.css).

Since Trofaf's markdown parser, [BlackFriday](https://github.com/russross/blackfriday), a great markdown parser for Go, adds the language from pre/code blocks to the class of the code block, I had to change some things around to get Rainbow to work. Why? Rainbow uses `data-language="go"` in order to determine what syntax to use (replace `go` with any language you're writing in). So here was my solution:

```javascript
$(document).ready(function() {
    var code = $('code');

    for (var i = 0; i < code.length; i++) {
        var lang = code[i].className;
        code[i].id = lang+i;
        id = '#'+code[i].id;
        $(id).attr('data-language', lang);
    }

    Rainbow.color();
});
```

JQuery gets all `code` elements and then loops through them all. Each time we go through the loop we get the class name and create an id for the current element. We don't want to give the same id to multiple elements if there are more than one pre/code blocks with the same language, so we add the integer `i` to the id to make sure that it's unique.

And that's it!
