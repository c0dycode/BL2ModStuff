### Installation ###
Extract both files into the "..\steamapps\common\Borderlands 2\Binaries\Win32" folder.




### Informations ###

Scrolling through the inventory can bug out, like it can for vendors, for example.

So far these methods have been reported to fix it:

- Reopen the Inventory
- Use the Arrowkeys
- Switch around items

## Eridium:
Select a range from 500 to 2147483647.

Note: Modifying Eridium with Gibbed, will only show you 200. While getting more than 500 ingame will actually show up as up to 999. Should you get more than 999, it'll still only show 999 but you'll actually have more.

## Max Level:
Choose from 72 up to 92.

## Backpack:
Choose the max amount of Slots and it's "Spacetrigger".

Spacetrigger :- The default is 39. This means, once you buy the last backpack SDU, and therefore reaching 39 backpackslots, that's the point where you'll have the chosen Max Slots instead.

Meaning - if you choose 24 as a Spacetrigger, you'll get your chosen Max Slots once your purchased SDUs would get you 24 slots. Then 24 will be the point where you'll have your chosen slots at.

Note: Lowering the Spacetrigger from 39 will most likely increase your Slots --TEMPORARILY-- when purchasing another backpack SDU. So these extra-slots will be gone after reopening the game.

##  Array-Limit
This is usually not needed.
However, people that come across this limit now have an automatic way of patching.
See an example here:
https://github.com/c0dycode/BL2ModStuff/tree/master/Hexediting#removing-the-100-element-limit

Array-Limit Enabled = Default. The Limit is active!
Array-Limit Disabled = The limit is removed!

Changelog
# v1.7
```
Fixed a small issue that caused weird patching for currencies.
Added a oneclick patch to use console, set-commands and change the ConsoleKey
For future developers/contributors: Also added Fody.Costura and a simple Ini-Library via NuGet. (Sourcecode will be available soon :TM: )
```

# v1.6
```
Swapped the UI to a Dark-Theme and cleaned up a few leftovers.
No changes on any functionality
```

# v1.5
```
Fixed an issue regarding the Backpackpatch. This has not affected anyone, since it would only be an issue when you'd have done the latest
backpack-patch manually. These instructions have not been public yet, so chances are basically 0% that you'd have been affected.
```

# v1.4
```
Added patching for maximum Money, Seraph Crystals and Torque Tokens (all max out at 2147483647)
```


# v1.3
```
- Added automatic patch for the Array-Limit
See an example here:
https://github.com/c0dycode/BL2ModStuff/tree/master/Hexediting#removing-the-100-element-limit

- 1-Click-Way to disable/enable Sanity Checks for Weapons 
- Added text to see the current version of the tool
```