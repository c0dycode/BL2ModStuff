# Some fun stuff I found to mess with. Default values in the command

## Climbing ladders super fast (increase Z-value)
```
set LadderVolume ClimbDir (X=0.0,Y=0.0,Z=1.0)
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

#The next 3 commands only last until you either die completely or got out of FFYL. Haven't found a permanent solution yet.
```
#Set WalkingSpeed for Gunzerker
set CharClass_Mercenary GroundSpeed 440.0

#Set Jumpheight for Gunzerker
set CharClass_Mercenary JumpZ 630.0

#Changes Movementspeed during FFYL
set PlayerInjuredDefinition InjuredMovementSpeed 150.0
```


# Other general commands, useful to write down

```
getall CustomizationData_Skin HeadMaterial
getall CustomizationData_Skin BodyMaterial
```