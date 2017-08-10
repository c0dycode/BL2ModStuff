# Some fun stuff I found to mess with. Default values in the command

## Climbing ladders super fast (increase Z-value)
```
set LadderVolume ClimbDir (X=0.0,Y=0.0,Z=1.0)
```
an easier command for this is

```
set Engine.Pawn LadderSpeed 200
```

## Change Gravity
```
set WorldInfo DefaultGravityZ -500.0
```

## Speed Up or slow down the game
```
set WorldInfo TimeDilation 1.0
```
### Note: This only works when executed in the game.

## Speed up EVERYTHING, even the warping screen, main menu etc

```
set GameInfo GameSpeed 1.0
```

# The next 3 commands only last until you either die completely or got out of FFYL.

```
#Set WalkingSpeed for Gunzerker
set CharClass_Mercenary GroundSpeed 440.0

#Set Jumpheight for Gunzerker
set CharClass_Mercenary JumpZ 630.0

#Changes Movementspeed during FFYL
set PlayerInjuredDefinition InjuredMovementSpeed 150.0
```

#Modify MovementSpeed permanently

```
set WillowPlayerPawn MovementSpeedModifier 1.5
```

The command above sometimes doesn't work for some reason, even happens as hotfix.
So as a fail-safe I also use all of these as hotfixes

```
GD_Tulip_Mechro_Streaming.Pawn_Mechromancer MovementSpeedModifier 3.0
GD_Mercenary_Streaming.Pawn_Mercenary,MovementSpeedModifier 3.0
GD_Assassin_Streaming.Pawn_Assassin,MovementSpeedModifier 3.0
GD_Siren_Streaming.Pawn_Siren,MovementSpeedModifier 3.0
GD_Lilac_Psycho_Streaming.Pawn_Lilac_Psycho,MovementSpeedModifier 3.0
GD_Soldier_Streaming.Pawn_Soldier,MovementSpeedModifier 3.0
```

# Modify crouchspeed
set Engine.CharacterClassDefinition CrouchedPct 0.5


#Modify gained Experience
This one will let you instantly level from lvl 1 to 72 with only one kill. So look up default values and modify them as you wish.

```
set globals BaseEnemyExperienceFormula (BaseValueConstant=100000)
set globals BaseEnemyExperienceFormula (BaseValueScaleConstant=100000000)

and this one as OnDemand Hotfix (Package = WillowGame)

set WillowGame.WillowAIPawn ExperiencePointMultiplier 100000
```


# Other general commands, useful to write down

```
getall CustomizationData_Skin HeadMaterial
getall CustomizationData_Skin BodyMaterial
```

Will give you the skin-objects currently loaded. When you play alone, this will only list your Head and Body for example.