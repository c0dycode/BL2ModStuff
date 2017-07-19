# Introduction
Since I've wanted to get back into programming lately, I've thought about a little standalone tool that allows you to do the hexediting for you and adjust the Backpackslots.

The same functionality will also be added to the FilterTool by LightChaosman.

Note: Since this is an early version, make a backup of your exe, just in case ;)

# Requirements
Only requirement is the .NET Framework 4.0, which most people should already have installed anyway.
If not, grab it here: https://www.microsoft.com/en-us/download/details.aspx?id=17851

# How to use
Just put ***both*** files into the same folder your Borderlands2.exe is in.
Then open up the exe and then there are two possible messages.

1. You haven't had any version of the backpack-edits before and the tool will ask you if it should do the patching for you.
2. You have the first version of the hexedit. The tool will offer you to update it to the second version.
3. No message, because you already have the latest version of the Hexedit applied :)

After that, you should be able to adjust the amount of slots accordingly.
Hit the ***Apply*** button to write your changes to the EXE-File.

***Spacetrigger***
The easiest way to explain this one, is to tell you how this whole patch works.

The game reads your current max backpackspace. If it's ***<Triggerspace>*** then it ***adds*** the given number. If it's not greater or equal ***<Triggerspace***> it does nothing. 

# Notes
As stated above, this is still an early version. It does not catch any errors yet.
Reverting the patch completely is not an option, yet. As a workaround you should be able to just set it to 0 and hit apply.


# Latest Testpatch
This one uses no "workaround solution" to increase the Backpackspace.
In theory, this should be more stable. It also allows to increase it up to 255 slots instead. That's the limit within this Tool. In theory you could go way past that.

```
Testversion of the Backpack-Slot-Customizer including the newest Backpack-Patch.

How to use and what to do:
Put into the Win32-folder where your Borderlands2.exe is aswell.
If you have any previous patch installed, let the tool remove it. If you don't, the Messagebox at launch tells you to ***NOT*** install the patch.

Once the tool is up, check the box for the ***Latest Testpatch*** and set your preferred values.

Spacetrigger = Have XY slots once you've reached <Spacetrigger-Value>.

By default, you'll need to have all Backpack-SDUs and then have to save and reload the game.
```

