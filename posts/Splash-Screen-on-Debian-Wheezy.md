---
Title: Splash Screen on Debian Wheezy
Description: Splash screen on Debian Wheezy instead of all that text.
Author: Luke Evers
Date: 2013-08-17 19:41
Lang: en
---

Some people may like seeing all the fun text on startup instead of a splash screen, but I am not one of them. Yeah, it was cool for the first 100 times I saw it, but after awhile you just get tired of it. So what's the best way to approach this? I tried a bunch of different things, but the best (and easiest) option is to use [Plymouth](https://wiki.debian.org/plymouth). It's in the repos, too!

They've got a wide-variety of splash screens, so don't worry. We'll configure them later.

#### Step 1: Install Plymouth

```shell
# Core
sudo apt-get install plymouth
# This is for picking themes
sudo apt-get install plymouth-drm
```

#### Step 2: Configure

##### Step 2a

Edit the file `/etc/initramfs-tools/modules` and add the modesetting for what best fits you:

###### Intel

```shell
intel_agp
drm
i915 modeset=1
```

###### Nouveau (nVidia)

```shell
drm
nouveau modeset=1
```

###### ATI

```shell
drm
radeon modeset=1
```

##### Step 2b

Now we have to configure Grub2 for whatever resolution best fits your needs. You'll find the file at `/etc/default/grub`. You can pick whatever, resolution you want, but I went with what my screen normally is.

```shell
GRUB_GFXMODE=1280x800
```

You'll also need to change this line `GRUB_CMDLINE_LINUX_DEFAULT="quiet"` to `GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"`.

##### Step 2c

Update grub!

```shell
sudo update-grub2
```

#### Step 3: Pick a Theme

To view all the themes you have installed, run this:

```shell
sudo /usr/sbin/plymouth-set-default-theme --list
```

Plymouth comes with a few themes, but if you want them all, there's another package to install with all of them, and you can install that too!

```shell
sudo apt-get install plymouth-themes-all
```

But how do we know what they look like? It would be really annoying to have to reboot each time you change splash screens just to see what they look like. Well, I've got just the solution! First you'll want to create a file called `ply.sh` and put this in it:

```shell
#!/bin/bash  
## Preview Plymouth Splash ##  
##   by _khAttAm_          ##  
##  www.khattam.info       ##  
##  License: GPL v3        ##  
chk_root () {  
 if [ ! $( id -u ) -eq 0 ]; then  
  echo Must be run as root  
  exit  
 fi  
}  
chk_root  
DURATION=$1  
if [ $# -ne 1 ]; then  
     DURATION=5  
fi  
plymouthd; plymouth --show-splash ; for ((I=0; I<$DURATION; I++)); do plymouth --update=test$I ; sleep 1; done; plymouth quit
```

As you can tell from the header, I did not write `ply.sh`, and I'd like to continue to keep that header at the top because of that. So anyways, how does this work? Before you do anything, make sure to `chmod +x ply.sh` and only run this as root.

So before you can actually use this, you'll have to install one more package.

```shell
sudo apt-get install plymouth-x11
```

If you've installed all of the themes when you do `--list` you should see these options:

```
details
fade-in
glow
joy
script
solar
spacefun
spinfinity
spinner
text
```

Now to test each theme we'll have to basically install each one and then run our script. Here's an example for `joy`, the splash that I'm currently using:

```shell
# Set theme
sudo /usr/sbin/plymouth-set-default-theme joy
# Install theme
sudo update-initramfs -u
# Test theme out! [OPTIONAL]
sudo ./ply.sh
```

To try any other ones just replace `joy` with the names of others! I've seen videos on YouTube of people who have customized their own themes, so if you don't find a theme that you like, search the web or create your own! I'm not sure how to create your own, but I'm sure there are tutorials out there.

#### Step 4: Reboot

And that's it! If you have any questions feel free to either search around for an answer, or contact me!
