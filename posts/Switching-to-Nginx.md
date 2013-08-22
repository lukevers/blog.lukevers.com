---
Title: Switching to Nginx
Description: Switching from Lighttpd to Nginx
Author: Luke Evers
Date: 2013-08-13 21:22
Lang: en
---

So after I've been told that [Nginx](http://wiki.nginx.org/Main) is far superior than [Lighttpd](http://www.lighttpd.net/) multiple times, I decided that I'd switch. Both [Dylan](http://dylwhich.com/) and [Sasha](http://speedfulpanic.net/) use Nginx, and since we're all using the same type of blog I figured I'd give it a shot.

At first I thought I had everything configured correctly, but I realized a few minutes before I started writing this that the mimetypes were screwed up for my [RSS](/rss) and specific blog posts without extensions. Luckily, Dylan already figured this out and explained exactly what I needed to do [in his blogpost](dylwhich.com/trofaf-and-nginx). It turns out I had to add this:

```generic
...
location / {
	 ...
	 default_type text/html;
	 location /rss {
	 	  default_type application/rss+xml;
	 }
}
...
```

### What I like about Nginx

I never really figured out the correct way to force ssl in Lighttpd, but in Nginx it was very simple. Right now my configuration file for `blog.lukevers.com` is still farily simple.

```generic
server {
       listen				80;
       server_name			blog.lukevers.com;
       rewrite				^ https://$server_name$request_uri? permanent;
}

server {
       listen				443;

       server_name			blog.lukevers.com;

       ssl					on;
       ssl_certificate		...;
       ssl_certificate_key	...;
       
       access_log			...;
       
       location / {
       		root			...;
			index			index.html;
			default_type	text/html;
			location /rss {
				 default_type application/rss+xml;
			}
       }
}
```

In Ligghtpd, my configuration file was always all over the place and extremely messy. Another thing I like about Nginx is the fact that it helps me keep everything clean and organized. 

### What I dislike about Nginx

So far I haven't really found anything that I dislike about Nginx. I guess if I find anything then I'll have to keep everyone updated!
