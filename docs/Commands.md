Commands I use and short info and a few reminders for me how to use some commands.

# Get Lootpools in current area

```
getall AIPawnBalanceDefinition Name
```

List all the lootpools in the current area.
We only need the last part after "XY.Name =".

```
PawnBalance_XY
```

Then ***obj dump*** it for example.


# Get the Levelnames

```
getall LevelTravelStationDefinition StationLevelName
```

Same thing here as above. Only the last part is needed.
To test the location, use
```
open XY
```

We can also use

```
getall LevelTravelStationDefinition DisplayName
```
If we just can't find the correct object name, for example:
I was trying to find ***Wildlife Exploitation Preserve*** and just couldn't find it.
This revealed to me, that it's ***GD_LevelTravelStations.Zone2.PandoraParkToCreatureSlaughter***
So I just ***obj dump*** it and look at the result for ***StationLevelName***


# Get the Drop Chance/Weight for DropODDS_BossUniqueRares for example
As I keep forgetting how and that I can do this -

```
obj dump GD_Itempools.DropWeights.DropODDS_BossUniqueRares
```

results in

```
ValueResolverChain(0)=ConstantAttributeValueResolver'GD_Itempools.DropWeights.DropODDS_BossUniqueRares:ConstantAttributeValueResolver_0'
```

Take ***GD_Itempools.DropWeights.DropODDS_BossUniqueRares:ConstantAttributeValueResolver_0*** and ***obj dump*** it to see the current value.

```
obj dump GD_Itempools.DropWeights.DropODDS_BossUniqueRares:ConstantAttributeValueResolver_0
```

```
=== ConstantAttributeValueResolver properties ===
ConstantValue=0.330000
```

Then set ConstantValue with

```
set GD_Itempools.DropWeights.DropODDS_BossUniqueRares:ConstantAttributeValueResolver_0 ConstantValue X.XX
```


# Setting up a hotkey for commands
Use the following command
```
set PlayerInput Bindings 
( 
(
Name = F8,
Command = "exec Spawn",
Control = false,
Shift = false,
Alt = false,
LeftTrigger = false,
RightTrigger = false,
bIgnoreCtrl = false,
bIgnoreShift = false,
bIgnoreAlt = false
) 
)
```

Switch ***F8*** to your preferred key and the command to whatever you want.
I had to put the command in ***"*** to keep the spaces.
In this case I just put ***getall WillowPopulationDefinition Name*** in the Spawn-file.

To execute multiple commands at the same time, split them with a ***pipe***-character. ->
For example:

```
Command = "exec Spawn | exec lp"
```

Press F8 in the game and the command will execute.

#### Note: This will only show the results in the log window. So either use the ***-log*** Launchparameter in steam, or enter ***showlog*** in the game console to toggle the log-window on and off.

# Togglebinds
Will explain these at some point.

# Leveling someone with Infinity made super easy
Instead of putting something onto your mouse or keyboard, you can aim at the correct spot and then type in ***startfire***. This will let you keep firing, even if you tab out of the game.

To stop, just type in ***stopfire***.



# More to be added