---
Title: OS X Terminal Notifier
Description: Create notification center notifications from bash on OS X!
Author: Luke Evers
Date: 2013-11-02 9:05
Lang: en
---

![terminal-notifier](/assets/img/terminal.png)

With the past few major updates for OS X, there has been a notification center that allows apps to send you push notifications at will. I started thinking, how can I do this from bash? After I did some searching around I found that there are a few ways that you can go about doing this.

### Growl

I have not tried this method myself because in order to use Growl, you have to buy it. Growl costs $3.99 in the app store, and for the notifications you are stuck with growl's icon. This doesn't seem like what we want.

### terminal-notifier

Terminal-notifier is an open source project on [Github](https://github.com/alloy/terminal-notifier) that solves this problem. The way it works is that you download the "app" and put it in your `/Applications` folder. Then when you want to use the terminal notifier, you could call `/Applications/terminal-notifier.app/Contents/MacOS/terminal-notifier` and execute the binary. Kind of silly, right? We could easily add that to our `$PATH` and all problems with that are solved! 

##### Installing

I've written a bash script that'll install terminal-notifier for you. NOTE: If you do not have `wget`, switch out `wget` for `curl -O`.

```bash
#!/bin/bash
wget https://github.com/downloads/alloy/terminal-notifier/terminal-notifier_1.4.2.zip
unzip terminal-notifier_1.4.2.zip
rm terminal-notifier_1.4.2.zip
mv terminal-notifier_1.4.2/terminal-notifier.app /Applications/
rm -rf terminal-notifier_1.4.2
```

##### Usage

As I said before, If you don't add the terminal-notifier location to your path, you're going to have to call it with the whole path: `/Applications/terminal-notifier.app/Contents/MacOS/terminal-notifier`.

But so how do I use it? When I run the binary without any arguments, here is what it tells you:

```bash
terminal-notifier (1.4.2) is a command-line tool to send OS X User Notifications.

Usage: terminal-notifier -[message|list|remove] [VALUE|ID|ID] [options]

   Either of these is required:

       -message VALUE     The notification message.
       -remove ID         Removes a notification with the specified `upâup` ID.
       -list ID           If the specified `upâup`ists show when it was delivered,
                          or use `ALL` to see all notifications.
                          The output is a tab-separated list.

   Optional:

       -title VALUE       The notification title. Defaults to `Terminal`.
       -subtitle VALUE    The notification subtitle.
       -group ID          A string which identifies the group the notifications belong to.
                          Old notifications with the same ID will be removed.
       -activate ID       The bundle identifier of the application to activate when the user clicks the notification.
       -open URL          The URL of a resource to open when the user clicks the notification.
       -execute COMMAND   A shell command to perform when the user clicks the notification.

When the user activates a notification, the results are logged to the system logs.
Use Console.app to view these logs.
```

Easy, right? So here's what I ran to produce what is in the image at the top of the article:

```bash
/Applications/terminal-notifier.app/Contents/MacOS/terminal-notifier -title "hello" -message "notifications"
```

##### Conclusion

Although it looks like it has some [issues](https://github.com/alloy/terminal-notifier/issues), particularly with OS X Mavericks, terminal-notifier does a nice job at what it does. I expect for these issues to be fixed since Mavericks just came out. In the meantime, try it out! 