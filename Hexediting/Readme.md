# Removing the 100 Element-limit

Usually you'd only get up to 100 elements per Array.
For example:

```
Attributes(89)=None
Attributes(90)=None
Attributes(91)=None
Attributes(92)=None
Attributes(93)=None
Attributes(94)=None
Attributes(95)=None
Attributes(96)=None
Attributes(97)=None
Attributes(98)=None
Attributes(99)=None
... 239 more elements
```

To remove this limit, we need to patch the Borderlands2.exe-file.

To remove the limit itself

Patch (this one also works for TPS):
```
7E 05 B9 64 00 00 00 3B F9 0F 8D
```
to
```
75 05 B9 64 00 00 00 3B F9 0F 8D
```

If you'd also like to remove the message ***... XY more elements***

Patch this aswell:
```
0F 8C 7B 00 00 00 8B 8D 9C EE FF FF 83 C0 9D 50
```
to
```
0F 85 7B 00 00 00 8B 8D 9C EE FF FF 83 C0 9D 50
```


# TPS Specific
To remove the message mentioned above -
patch:
```
7C 7B 8B 8D 94 EE FF FF
```
to
```
75 7B 8B 8D 94 EE FF FF
```



Here are a few things to test it with
```
obj dump GD_AttributePresentation._AttributeList.DefaultPresentationList
obj dump Common_Materials.Creature.Master_CreatureShock
obj dump Common_Materials.Creature.Master_CreatureSlag
obj dump Common_Materials.Environment.Master_Barrel
obj dump Common_Materials.Environment.Master_Rocks
obj dump Common_Materials.Environment.Master_World
obj dump Common_Materials.Environment.Master_WorldMasked
obj dump Common_Materials.Items.Master_ClassMod_02
obj dump Common_Materials.Items.Master_ShieldGrenade
obj dump Common_Materials.Player.Master_Player
obj dump Common_Materials.Weapons.Master_Gun
obj dump FX_WEP_Scopes.Materials.Mat_Scope_Reticle_MS
obj dump GD_AttributePresentation._AttributeList.DefaultPresentationList
obj dump GD_CustomItemPools_MainGame.AllCustomizationsItemPool
```

Thanks to LightChaosman for telling me about this issue :D


# Increasing Backpack-Storage

Find

 ```
 CC CC 8B 81 B8 01 00 00 C3 CC CC CC CC CC CC CC CC CC
 ```

 and replace with 

 ```
 CC CC 8B 81 B8 01 00 00 83 C0 05 C3 CC CC CC CC CC CC
 ```

 Replace the ***05*** with the value you want to increase the backpack-storage with (in HEX).
***The maximum value you can use*** to increase your inventory slots, is ***7F***.
7F = 127

You can either use the Windows Calculator to convert from decimal to hex, or simply go to this site:

http://www.rapidtables.com/convert/number/decimal-to-hex.htm

The value you use instead of the ***05*** is added to that base-value in the game. So with all upgrades you have 39 slots. If you then use the ***05*** you'll now have 44 slots.

Should you encounter the bug where you can't scroll anymore, I could fix it by either reopening the inventory or tabbing out and back into the game.

***Note***: This will extend your inventoryslots by the given number each time you save and reload the game until you reach 39 slots + the given number.

# New method

To fix the side-effect noted above, here's a method that checks the amount of slots. Once you've reached 39 slots, your backpackspace will increase by the given number.

```
8B 81 B8 01 00 00 83 F8 27 7D 01 C3 83 C0 05 C3
```

If you have done the first version-edit before, you'll need to "overwrite" it.
That means:
```
CC CC 8B 81 B8 01 00 00 83 C0 05 C3 CC CC CC CC CC CC
```

will become

```
CC CC 8B 81 B8 01 00 00 83 F8 27 74 01 C3 83 C0 05 C3
```

Again, replace the ***05*** with the amount of slots you want to get after reaching max slots. This won't make the Backpack-SDUs useless.

Thanks to LightChaosman and MediEvilHero for pointing that out :)

# Bugreports
- Orudeon told me he couldn't pickup anything although he had 14/23 backpackspace, when the Host didn't have the hexedit. This still needs confirmation, more testing though. (This was with the first version of the edit)