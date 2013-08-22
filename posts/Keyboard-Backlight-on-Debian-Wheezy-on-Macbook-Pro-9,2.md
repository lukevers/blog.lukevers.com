---
Title: Keyboard Backlight on Debian Wheezy with Macbook Pro 9,2
Description: I finally got the keyboard backlight to work on my macbookpro9,2!
Author: Luke Evers
Date: 2013-08-15 15:46
Lang: en
---

I'm not sure how many MacbookPro Debian users out there, but if you haven't figured out how to get the keyboard backlight to work, this is for you! I won't bother you with every wrong choice that I made while trying to figure this out, but I will get straight to the point and tell you how to get this done! From what it seems like, most (or even I could go as far as to say all) Macbook Pro models seem to be supported! I haven't seen a list of what is supported, but this has been the best package to use as of right now.

#### Applesmc-dkms

That's what it's called! On [their website](http://bitmath.org/code/applesmc-dkms/) it says:

```
As of 25OCT2008, the package applesmc-dkms is available in the mactel ppa. 
It supports the new unibody Macbook 5 and Macbook Pro 5. 
```

You can either add the PPA, compile it from source, or download a deb file and install it with `dpkg`. The quickest way (unless you already have the PPA on your computer) would just be to download the deb file directly from [here](https://launchpad.net/~mactel-support/+archive/ppa/+files/applesmc-dkms_0.18.2_all.deb). You can also view all of the packages from that PPA [here](https://launchpad.net/~mactel-support/+archive/ppa/+packages).

Once you install it, reboot your computer and it should work. :)