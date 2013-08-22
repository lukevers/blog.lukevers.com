---
Title: Switching to Weechat
Description: Weeeeeeechat!
Author: Luke Evers
Date: 2013-08-15 09:48
Lang: en
---

I've been wanting to switch from [xchat](http://xchat.org/) to [weechat](http://www.weechat.org/) for awhile now, but for some reason I always put it off. I'm not really sure why becuase it is wonderful!

The only problem so far is that I've had to change some of the keybindings, which is farily easy. I don't have a page up key or a page down key, so I had to set new bindings for them. I'm on a `macbookpro9,2` dual booting Debian Wheezy and OS X (which I'll save for another blog post), so I decided to use my Apple (or command) button.

#### My Dilemma

So what's the name of the Apple key? If you're in weechat, it's extremely easy to find out because they get it for you when you add a new keybinding. For my keybindings I used `Command+Up` (page up) and `Command+Down` (page down).

```generic
/key bind (alt + k) (keybinding)
```

It ended up spitting out `meta-0A` for page up and `meta-0B` for page down! I believe that the Command key has a different keybinding on Debian than `meta` (or at least it should), but I forgot that I set the Control key and the Command key to the same thing so I can use either for it.

So in the end, I ended up using these two commands:

```generic
/key bind meta-0A /window page_up
/key bind meta-0B /window page_down
```

#### Conclusions

I haven't used weechat more than an hour now, but it looks like weechat is here to stay! Besides, it's so fun to just say weeeeeeeeeeechat!
