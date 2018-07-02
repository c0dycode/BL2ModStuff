# !!!OUTDATED!!!
Use this instead:
https://github.com/c0dycode/BL-AutoexecDLL

# General Features (both versions)
* Automatically launch your Steamversion of Borderlands 2
* Autoexec your patch-file (patch.txt by default)
## NOTE: It can not check if the execution has actually worked. Or if it was too early. At least not yet.
* Showing a Tooltip next to your cursor when patch has been executed

# Extra Features in the Tools-Version
* Toggle RapidFire-Script with CTRL+F2
* Hotkey (F9) to OBJ DUMP whatever you have in your clipboard

## Currently known issues | What's being worked on
* Improved the RapidFire-Script even more.
* ~~The RapidFire-Script is a lot more usable now. While looking up similar issues, I've seen someone mention this exact same problem with BL2 or maybe even UE3 in general with AutoHotkey. So ther's a good chance this will be the best it'll be.~~
* ~~Using the RapidFire-Script will make aiming harder since it's basically interrupting your mouse movement every X ms. Currently looking into that.~~


## Introduction
Okay, I've written this little Autohotkey-Script to allow you to not having to type it manually in the console.

This is NOT a timesaver and will not be, due to the time it takes when we can actually execute the patches.

During the time it takes for everything to load, you can easily type "exec patch.txt" and wait for the soundqueue I've been waiting for up until now.

This is just for the "lazy" people.

I'll provide the Sourcecode for the ones that want to compile it themselves or for people that already have Autohotkey installed.

You'll need the additional image-file though.

## What does it do?

1. It checks if the ***Autoexec.ini*** is there already. If not, it'll create it and enter the default values. You can customize them afterwards however you want.
2. It more or less calculates a fairly small area depending on your resolution. I'm using 1920x1080, so if you're having issues just hit me up, or edit the source code and run it yourself :)
3. It checks if the ***Borderlands2.exe*** is already running, and if not, it launches it over steam.
4. It'll activate and focus the window for you. Tabbing out, if you're playing Exclusive Fullscreen, won't really work, since it'll monitor your screen for a specific area.
5. It'll then search the upper right corner of the game-screen for the content in this picture ![BL2Check](./BL2Check.png)
6. If it has found the area, it'll wait ***6000ms*** by default. This works out for me. Though BL2 is on an SSD. So you may have to change that in the ***Autoexec.ini***. 
7. It'll then open up the Console by pressing your COnsolekey and type ***exec patch.txt*** by default, press Enter and close the Console again. You won't even see it probably. All I see is my mouse-cursor all of a sudden :P. You can also change the patchname in the INI-file.
8. It'll then close itself and DONE.

## Installation
Put it wherever you want.

Now go here and listen to this soundclip I uploaded.
https://instaud.io/private/e479b3b9ebfee800a3594f912938c7954f46fc5e

The last two seconds or so are the queue for me, where I can execute the patches. That's about the point where I won't get any errors.
Execute the tool once, make sure BL2 is closed though, so you can adjust the delay properly, check what the console does and check if you've gotten any errors. If so, exit BL2 completely, raise the delay and try again.

## Pre-Compiled and infos about it
I'll put up the precompiled version. This includes the image-file(s) already and it'll be "extracted" out of the .exe-file during runtime. It'll stay there and should it be deleted, modified or whatever, it'll be overwritten again.

Some people would sooner or later "discover" that the Description is not "Autohotkey" but "Chromeium" instead.

This is just a very cheap attempt to avoid ***very*** stupid anti-cheat tools lol.
That's the only thing that differs from the official Autohotkey-version. Most "AutoHotkey"-references were just renamed to Chromeium.

## Borderlands 2 Autoexec + Tools variant
I've added this one now, since I thought it could make digging through stuff a little bit easier.

Difference to the normal version is:
I've added a Hotkey ***F9***. What it does, if you press F9, and the script will focus back onto BL2. It'll then check whether you already have the console open or not. If you do, it'll skip the step of opening it. So it's not getting closed.

Next it'll type ***obj dump*** for you, paste whatever you have in your clipboard and send the command.

It also got a Toggle-RapidFire-Script now. As long as BL2 is focused, you can hit CTRL+F2 to toggle it on and off. While it's active, all you need to do is hold down your left mouse button. You can change the ***RapidFireDelay*** in the INI-file to whatever you like.

Remember, some Anti-Cheat-Tools don't like Autohotkey. For this reason I've added a check every ***5000ms*** if Borderlands is still running. If it's not, the script will exit automatically.
