# Adding commands into the patch-file

Adding a commands into the patch-file is really easy with the FilterTool.

Right click a category where you want your code and click ***Insert code***.

## Normal code

Normal codes are the ones that you basically set and forget.
They do not need to be re-applied.
There is not really anything to mention about these here.

Confirm with OK and you're done.

## Hotfix entry

#### When and why hotfixes are needed.
You can skip this one if you know what hotfixes are and when/why they're used.

The easiest way to describe hotfixes is to give you an example.

In my Lootpools guide I ***obj dump*** the Sheriff's lootpool.

```
obj dump PawnBalance_Sheriff
```

If we'd try this in Sanctuary for example, we couldn't. The package/object for this isn't loaded. So the game does not know what we're talking about.

Now, what would happen if we tell the game to change a value inside that "package"? It can't because it's not there (yet).

That's where hotfixes come into play.
You basically tell the code when to execute/re-execute.

* After hitting continue in the main menu
* When Package XY is being loaded (so it's accessible to modify)
* When a/the given Level is being loaded

#### Adding the hotfix

Choose ***Hotfix entry*** at the top.
You'll now be able to choose the type (when to trigger this code) in the top left corner.

Choose whatever fits your code the best.

###### Level
Should you choose Level, you have two possibilities.
You either leave it at ***None***, which will basically execute your code everytime you switch to a different location/fasttravel

or

set a specific Levelname where it's supposed to trigger the execution of the code. You can find a guide for that [here](https://github.com/c0dycode/BL2ModStuff/blob/master/Commands.md##get-the-levelnames).

###### OnDemand
OnDemand pretty much works exactly the same as Level above.
Instead of a levelname you provide a "package" which when loaded triggers our code.

For example, we want to execute code xy when I play as a Gunzerker, or somebody with a Gunzerker joins the game.
So our trigger in this case would be

```
GD_Mercenary_Streaming
```

Insert your code, click OK and you're DONE.

# Hint: For code with multiple lines, use the ***Auto format***-button in the top right. It's amazing!


# Credits

Thanks to LightChaosman for this awesome tool :)