---
Title: Mimetypes in Lighttpd
Description: Setting the deafult mimetype
Author: Luke Evers
Date: 2013-08-06 10:39
Lang: en
---

So at first when I set up this blog, I was having problems with my RSS feed. I noticed that when I clicked any link on my RSS feed, instead of loading the page that it links to, it asked you where to save your downloaded file! I was confused at first, but then I realized that it wasn't a problem with [Trofaf](https://github.com/PuerkitoBio/trofaf), but that it was an issue with mimetypes and Lighttpd. The default mimetype for Lighttpd is `application/octet-stream` when I want it to be `text/html`. 

So what's the best way to fix this? Change the default mimetype! So at first, I added this:

```shell
mimetype.assign = ( "" => "text/html" )
```

And then I got an error saying that a reference to mimetype has already been made, so I searched my config file and then I realized that it was coming from here:

```shell
/usr/share/lighttpd/create-mime.assign.pl
```

A simple perl script that generated all of the mimetypes. After thinking for a second, I figured out what I could do!

```shell
mimetype.assign += ( "" => "text/html" )
```

Voilá! The default mimetype is now set to `text/html`.
