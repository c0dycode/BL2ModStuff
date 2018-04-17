# Removing Badass Rewards

Remove the one you do not want from this list:

```
set globals BadassRewards 
(
    BadassRewardDefinition'GD_Challenges.BadassRewards.BARD_Health_Max',
    BadassRewardDefinition'GD_Challenges.BadassRewards.BARD_Shield_Max',
    BadassRewardDefinition'GD_Challenges.BadassRewards.BARD_Shield_RechargeDelay',
    BadassRewardDefinition'GD_Challenges.BadassRewards.BARD_Shield_RechargeRate',
    BadassRewardDefinition'GD_Challenges.BadassRewards.BARD_Melee_Damage',
    BadassRewardDefinition'GD_Challenges.BadassRewards.BARD_Grenade_Damage',
    BadassRewardDefinition'GD_Challenges.BadassRewards.BARD_Gun_Accuracy',
    BadassRewardDefinition'GD_Challenges.BadassRewards.BARD_Gun_Damage',
    BadassRewardDefinition'GD_Challenges.BadassRewards.BARD_Gun_FireRate',
    BadassRewardDefinition'GD_Challenges.BadassRewards.BARD_Gun_RecoilReduction',
    BadassRewardDefinition'GD_Challenges.BadassRewards.BARD_Gun_ReloadSpeed',
    BadassRewardDefinition'GD_Challenges.BadassRewards.BARD_StatusEffect_ProcChance',
    BadassRewardDefinition'GD_Challenges.BadassRewards.BARD_StatusEffect_Damage',
    BadassRewardDefinition'GD_Challenges.BadassRewards.BARD_CriticalHitDamage'
)
```

This way they won't show up anymore!

# TextMarkupDictionary

getall TextMarkupDictionary Dictionary

```
TextMarkupDictionary GD_Globals.UI.TheTextMarkupDictionary.Dictionary =
(MarkupTag="ClassRequirement",HTMLMarkupBeginText="<font size='16'>",HTMLMarkupEndText="</font>",MarkupBeginTag="[ClassRequirement]",MarkupEndTag="[-ClassRequirement]")
(MarkupTag="ClassRequirementNotMet",HTMLMarkupBeginText="<font size='16' color="#E96464">",HTMLMarkupEndText="</font>",MarkupBeginTag="[ClassRequirementNotMet]",MarkupEndTag="[-ClassRequirementNotMet]")
(MarkupTag="enemy",HTMLMarkupBeginText="<font color="#00FFFF"><i>",HTMLMarkupEndText="</i></font>",MarkupBeginTag="[enemy]",MarkupEndTag="[-enemy]")
(MarkupTag="item",HTMLMarkupBeginText="<font color="#FF00FF"><i>",HTMLMarkupEndText="</i></font>",MarkupBeginTag="[item]",MarkupEndTag="[-item]")
(MarkupTag="person",HTMLMarkupBeginText="<font color="#00FF00"><i>",HTMLMarkupEndText="</i></font>",MarkupBeginTag="[person]",MarkupEndTag="[-person]")
(MarkupTag="place",HTMLMarkupBeginText="<font color="#00FF00"><i>",HTMLMarkupEndText="</i></font>",MarkupBeginTag="[place]",MarkupEndTag="[-place]")
(MarkupTag="projectilecount",HTMLMarkupBeginText="<font size='12' color='#FFCC00'>",HTMLMarkupEndText="</font>",MarkupBeginTag="[projectilecount]",MarkupEndTag="[-projectilecount]")
(MarkupTag="skill",HTMLMarkupBeginText="<font color="#FFDEAD"><i>",HTMLMarkupEndText="</i></font>",MarkupBeginTag="[skill]",MarkupEndTag="[-skill]")
(MarkupTag="MissionItem",HTMLMarkupBeginText="<font color="#00FFFF">",HTMLMarkupEndText="</font>",MarkupBeginTag="[MissionItem]",MarkupEndTag="[-MissionItem]")
(MarkupTag="explosive",HTMLMarkupBeginText="<font color="#F1D300">",HTMLMarkupEndText="</font>",MarkupBeginTag="[explosive]",MarkupEndTag="[-explosive]")
(MarkupTag="incendiary",HTMLMarkupBeginText="<font color="#F57500">",HTMLMarkupEndText="</font>",MarkupBeginTag="[incendiary]",MarkupEndTag="[-incendiary]")
(MarkupTag="corrosive",HTMLMarkupBeginText="<font color="#79DC3D">",HTMLMarkupEndText="</font>",MarkupBeginTag="[corrosive]",MarkupEndTag="[-corrosive]")
(MarkupTag="shock",HTMLMarkupBeginText="<font color="#00BDF3">",HTMLMarkupEndText="</font>",MarkupBeginTag="[shock]",MarkupEndTag="[-shock]")
(MarkupTag="slag",HTMLMarkupBeginText="<font color="#9B00DE">",HTMLMarkupEndText="</font>",MarkupBeginTag="[slag]",MarkupEndTag="[-slag]")
(MarkupTag="health",HTMLMarkupBeginText="<font color="#E96464">",HTMLMarkupEndText="</font>",MarkupBeginTag="[health]",MarkupEndTag="[-health]")
(MarkupTag="funstat",HTMLMarkupBeginText="• ",MarkupBeginTag="[funstat]",MarkupEndTag="[-funstat]")
(MarkupTag="blackmarket",HTMLMarkupBeginText="<font color="#FFDEAD">",HTMLMarkupEndText="</font>",MarkupBeginTag="[blackmarket]",MarkupEndTag="[-blackmarket]")
(MarkupTag="alreadyused",HTMLMarkupBeginText="<font size='16' color="#FF0404">",HTMLMarkupEndText="</font>",MarkupBeginTag="[alreadyused]",MarkupEndTag="[-alreadyused]")
```