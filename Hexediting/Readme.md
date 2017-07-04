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

Patch:
```
7E 05 B9 64 00 00 00 3B  F9 0F 8D A6 00 00 00 6A
```
to
```
75 05 B9 64 00 00 00 3B  F9 0F 8D A6 00 00 00 6A
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