# 1. Find the Lootpool of the specific enemy you want to modify.

Move to the area the enemy spawns in and enter this into the console:
***getall AIPawnBalanceDefinition Name***

If you don't want to remember the exact command, you can also just create a new file in "Borderlands 2\Binaries\"

Remember, you don't need to give it an extension. So you can just create a new .txt file, edit it, and save it/rename it to just "lootpool" for example.

This way you can just type ***exec lootpool*** instead of ***exec lootpool.txt*** for example.

In this example I'm in Lynchwood at the Travel Station and want to get the "Sheriff"'s Lootpool.
The command results are the follwing:

![Step1](./images/Step1.jpg)
So we found the "Balance" of the "Sheriff". (marked red)
We only need the green marked part though.

Now we'll ***obj dump*** it.

So in this example:
***obj dump PawnBalance_Sheriff***

![Step2](./images/Step2.jpg)

For ease of access here's the result we need:

DefaultItemPoolList(0)=(ItemPool=ItemPoolDefinition'GD_Sheriff.WeaponPools.Pool_Weapons_SheriffPistols_EnemyUse',PoolProbability=(BaseValueConstant=1.000000,BaseValueAttribute=None,InitializationDefinition=None,BaseValueScaleConstant=1.000000))
DefaultItemPoolList(1)=(ItemPool=ItemPoolDefinition'GD_ItempoolsEnemyUse.Shields.Pool_Shields_Standard_EnemyUse',PoolProbability=(BaseValueConstant=1.000000,BaseValueAttribute=None,InitializationDefinition=None,BaseValueScaleConstant=1.000000))
DefaultItemPoolList(2)=(ItemPool=ItemPoolDefinition'GD_Itempools.Runnables.Pool_Sheriff',PoolProbability=(BaseValueConstant=0.000000,BaseValueAttribute=AttributeDefinition'GD_Itempools.DropWeights.DropODDS_BossUniqueRares',InitializationDefinition=None,BaseValueScaleConstant=1.000000))

# 2. Modify the Lootpool

Since ***DefaultItemPoolList(2)*** is the only one that is not a guaranteed drop everytime, we're going to up the chance a bit.

The simplest way of modifying the drop chance is:

***BaseValueConstant x BaseValueScaleConstant***=Effective chance for this loot.

For the values:

1.000000 = 100

0.900000 = 90

0.100000 = 10

so, it's easy enough :)

Let's say we want a guaranteed drop, so let's change 
***GD_Itempools.Runnables.Pool_Sheriff',PoolProbability=(BaseValueConstant=0.000000***
to
***GD_Itempools.Runnables.Pool_Sheriff',PoolProbability=(BaseValueConstant=1.000000***

With this method we can only change this if we include all three pools, that were there by default, into the command. AFAIK changing specifics only works with hotfixes.

For step three, we take another look at the result of "obj dump PawnBalance_Sheriff"
The orange marked area shows you the execution of the command and the very first line it printed out for us.
We see the class we need for the command (marked red).

![Step3](./images/Step3.jpg)

So we start off our command with
***set GD_Population_Sheriff.Balance.PawnBalance_Sheriff***

Since we want to modify one of the *** DefaultItemPoolList(x) ***, this will be our variable name.
The syntax is:

```
set <class> <variable> <value>
```

(For more information goto the unrealengine link below)

***set GD_Population_Sheriff.Balance.PawnBalance_Sheriff DefaultItemPoolList***

We will remove "DefaultItemPoolList(0)=", DefaultItemPoolList(1)= and DefaultItemPoolList(2)= in the command
since we basically recreate the array with the set-command and the command already knows what we want to set at this point with the command.

That leaves us with:

(ItemPool=ItemPoolDefinition'GD_Sheriff.WeaponPools.Pool_Weapons_SheriffPistols_EnemyUse',PoolProbability=(BaseValueConstant=1.000000,BaseValueAttribute=None,InitializationDefinition=None,BaseValueScaleConstant=1.000000))
(ItemPool=ItemPoolDefinition'GD_ItempoolsEnemyUse.Shields.Pool_Shields_Standard_EnemyUse',PoolProbability=(BaseValueConstant=1.000000,BaseValueAttribute=None,InitializationDefinition=None,BaseValueScaleConstant=1.000000))
(ItemPool=ItemPoolDefinition'GD_Itempools.Runnables.Pool_Sheriff',PoolProbability=(
BaseValueConstant=1.000000,BaseValueAttribute=AttributeDefinition'GD_Itempools.DropWeights.DropODDS_BossUniqueRares',InitializationDefinition=None,BaseValueScaleConstant=1.000000))

Add a single "(" infront and add this to "set GD_Population_Sheriff.Balance.PawnBalance_Sheriff DefaultItemPoolList" - DONE.

https://docs.unrealengine.com/udk/Three/ConsoleCommands.html


If there are any mistakes feel free to hit me up on shadow's discord (c0dycode) :)

Thanks to Shadow's Patch and Discord-Community
Especially the_Nocturni who explained it, also Mike and EarthAries who started that conversation where I could get most of the infos from :P
