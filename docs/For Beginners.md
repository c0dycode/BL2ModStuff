In this guide I want to show people, that are new to this, how I started and what made this whole process a lot easier for me.

# What you will need

[Unreal Package Decompressor](http://www.gildor.org/downloads)

[UE Explorer](http://eliotvu.com/portfolio/view/21/ue-explorer)


# 1: Preparing the Files and UE Explorer

Extract the decompressor and install UE Explorer.

Copy the two files below from ***\Borderlands 2\WillowGame\CookedPCConsole*** into the folder where the ***decompress.exe*** is located.

	* Startup.upk
	* Engine.upk

Just drag them onto the ***decompress.exe*** now and you should now have a new folder called ***unpacked*** in there.

These files are the ones you want to open up in UE Explorer.

# Note: Unfortunately UE Explorer won't show you all objects/classes etc. I'll follow up with a few other methods on how to find more stuff.

# 2: Using UE Explorer
### 2.1: Using Startup.upk

Let's open up the decompressed ***Startup.upk***.

On the left side at the top, click now on ***Objects*** and below on ***Content***.

You'll now see a big treeview of all the objects UE Explorer could find. Let's open up
***GD_Itempools*** for example.

Now we can see all the objects that are inside of ***GD_Itempools***.
So let's use ***DropWeights*** for example.

This is the object that contains the ***DropODDS***-Objects. So basically the odds of this object dropping something.

![StartupOverview](./images/StartupOverview.png)

Let's check ***DropODDS_BuffDrinks***. Inside we see two objects. Click on ***ConstantAttributeValueResolver_1*** and on the right side we'll see the property ***ConstantValue*** with a value of ***0.050***.

Now check the "// Reference:"-line below.

We can copy almost everything from this to directly use it in the game.
***GD_Itempools.DropWeights.DropODDS_BuffDrinks.ConstantAttributeValueResolver_1*** in this case.

So to change the ConstantValue in the game, we can just use this in the console:

```
set GD_Itempools.DropWeights.DropODDS_BuffDrinks.ConstantAttributeValueResolver_1 ConstantValue 0.65
```

### 2.2: Using Engine.upk
#### Note: Also this won't show you everything there is. You'll find a lot more if you use the console in the game to poke around. This should give you a good basic understanding of what to look for, what you can use and where/when.

Using UE Explorer with the Engine.upk is a little bit different but revealed a lot more stuff to me.

Here's a small example.

First we open it up. Once again we choose ***Objects*** at the top-left.
This time, if we click on ***Content*** we barely get anything.

BUT, this time we can click on ***Classes*** instead.

![Classes](./images/Classes.png)

Here, we can also actually use the search-function. This is incredibly useful.
You can either click on ***Tools -> Find -> Find in classes*** or press CTRL+Shift+F. Enter any keyword you're looking for.

For this example I'm just going to open up the class ***Camera*** instead.

On the right side, you'll now see actual code.
The best things can usually be found at the very bottom of the class. It's basically a list of all the ***defaultproperties*** being used by this class.


Let's say we'd like to change the value of ***DefaultFOV***.

Building the command for this is very easy.

Take the ***class name***, the ***propertyname*** and the ***value*** you want, type ***set*** in front of it, and you got your command.

For this example:

```
set Camera DefaultFOV 85.0
```


## 2.3: Setting Array-types in UE Explorer
First click on ***Options*** at the top. In this new window click ***Add*** in the top-middle of the window.

What I've added there are two things so far.
```
Package.Object.Class.ValueResolverChain:ObjectProperty
Package.Object.Class.BalancedItems:PointerProperty
```

How you get these? To be completely honest, I have no idea. :P

I just played around and ended up with something that apparently works.
So what I ended up doing was this:

I opened up the ***Startup.upk*** and unfolded the ***GD_Itempools***-entry.

On the right side you'll see
```
Package'GD_Itempools'
```

So, Package is the very first part of our Array-type. Also the very first thing you open up in UE Explorer.

The next one will be the ***Object***, so for example ***Runnables***.
The orange entry is the ***Class***. So let's click on ***Pool_KingMong***.

If we have not set up any Array types, we will now see:

```
BalancedItems=/* Array type was not detected. */
```

Since we want to see the results of ***BalancedItems*** we will choose this as the last path for the Array-type.

What is left now, is the correct type in the end. Head back into the ***Options***-screen and play around with the Types. After selecting one, the "Group"box above should now have ***:YOURCHOSENTYPE*** behind everything else. Hit ***Save*** on the right side, switch back to the ***Startup.apk***-Tab, click on ***Tools*** below the Tab and ***Reload***.

You'll see, that ***BalancedItems*** now will show up in a similar way as if you'd have obj dumped it in the game.

Redo the same thing for other Properties and replace them with ***BalancedItems*** and try out different ***Types*** if needed.

***Package.Class.ResourcePools*** worked best with ***:ObjectProperty*** for example.


For everything I use, I'll try to keep the list down below updated.
Should you play around with these and see that I chose one that makes less sense with the results, hit me up, so I can fix it.

# 2.4: My Array-types

```
Package.Object.Class.ValueResolverChain:ObjectProperty
Package.Object.Class.BalancedItems:PointerProperty
Package.Class.ResourcePools:ObjectProperty
Package.Class.InputContexts:PointerProperty
Package.Class.PlayerClassAchievementData:PointerProperty
Package.Class.EligibleUsage:ObjectProperty
Package.Class.OnLevelUp:ObjectProperty
Package.Class.OnLevelUpNaturally:ObjectProperty
Package.Class.Behaviors:ObjectProperty
Package.Class.Behaviors.SkillEffectDefinitions:PointerProperty
Package.Class.ContextResolverChain:ObjectProperty
Package.Class.AssetPaths:PointerProperty
Package.Class.Dependencies:ObjectProperty
Package.Class.Manufacturers:PointerProperty
```