Commands I use and short info and a few reminders for me how to use some commands.

# Get Lootpools in current area.

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
getall LevelTravelSationDefinition StationLevelName
```

Same thing here as above. Only the last part is needed.
To test the location, use
```
open XY
```

# Get the Drop Chance/Weight for DropODDS_BossUniqueRares for example
As I keep forgetting how and that I can do this -

```
obj dump GD_Itempools.DropWeights.DropODDS_BossUniqueRares
```

results in

```
ValueResolverChain(0)=ConstantAttributeValueResolver'GD_Itempools.DropWeights.DropODDS_BossUniqueRares:ConstantAttributeValueResolver_0'
```

Take ***GD_Itempools.DropWeights.DropODDS_BossUniqueRares:ConstantAttributeValueResolver_0*** and ***obj dump*** it.

```
obj dump GD_Itempools.DropWeights.DropODDS_BossUniqueRares:ConstantAttributeValueResolver_0
```

Then set ConstantValue with

```
set GD_Itempools.DropWeights.DropODDS_BossUniqueRares:ConstantAttributeValueResolver_0 ConstantValue X.XX
```



# More to be added probably