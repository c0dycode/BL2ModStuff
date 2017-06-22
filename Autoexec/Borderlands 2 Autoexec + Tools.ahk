;Made by c0dycode
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
#SingleInstance, FORCE
#Persistent
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
;~ SendMode Input
SetWorkingDir %A_ScriptDir%
CoordMode, Pixel, Client
SetTitleMatchMode, 3
FileInstall, BL2Check.png, BL2Check.png, 1
FileInstall, BL2Check2.png, BL2Check2.png, 1

RapidFire := 0
PatchExecuted := 0

ToolTipOff:
SetTimer, ToolTipOff, Off
ToolTip

SetTimer, IsBorderlandsClosed, 5000
SetTimer, IsBorderlandsClosed, Off

IfNotExist, Autoexec.ini
{
    IniWrite, patch.txt, Autoexec.ini, Settings, patchname
    IniWrite, 7000, Autoexec.ini, Settings, delay
    IniWrite, 20, Autoexec.ini, Settings, RapidFireDelay
}

IfExist, Autoexec.ini
{
    IniRead, patchname, Autoexec.ini, Settings, patchname
    IniRead, delay, Autoexec.ini, Settings, delay, 7000
    IniRead, rapidfiredelay, Autoexec.ini, Settings, RapidFireDelay, 20
    IniRead, ConsoleKey, %A_MyDocuments%\My Games\Borderlands 2\WillowGame\Config\WillowInput.ini, Engine.Console, ConsoleKey
    
    IniWrite, %patchname%, Autoexec.ini, Settings, patchname
    IniWrite, %delay%, Autoexec.ini, Settings, delay
    IniWrite %rapidfiredelay%, Autoexec.ini, Settings, RapidFireDelay
}
Width := 1.15 * (A_ScreenWidth / 2) 
Height := A_ScreenHeight / 3

If !ProcessExist("Borderlands2.exe")
    Run, steam://rungameid/49520
else
{
    IfEqual, PatchExecuted, 0
        goto RunAutoexec
    else
        goto GameIsRunning
}

RunAutoexec:
WinActivate, ahk_class LaunchUnrealUWindowsClient
WinWaitActive, ahk_class LaunchUnrealUWindowsClient
WinShow, ahk_class LaunchUnrealUWindowsClient
while (1)
{    
    If !ProcessExist("Borderlands2.exe")
    ExitApp
    
    WinActivate, ahk_class LaunchUnrealUWindowsClient
    WinWaitActive, ahk_class LaunchUnrealUWindowsClient
    WinShow, ahk_class LaunchUnrealUWindowsClient
    ImageSearch, Xpos, YPos, %Width%, %Height%, %A_ScreenWidth%, %A_ScreenHeight%, *130 BL2Check.png
    
    if errorlevel=0
        break   ; stop the while if the image is found
}
Sleep, %delay%
WinActivate, ahk_class LaunchUnrealUWindowsClient
WinWaitActive, ahk_class LaunchUnrealUWindowsClient
WinShow, ahk_class LaunchUnrealUWindowsClient
IfEqual, ConsoleKey, Tilde
    Send, ~
else
    Send, {F6}
Send, exec{Space}
Send, %patchname%
Send, {Enter}
Send, {Escape}
ToolTip, Patch has been executed!
SetTimer, ToolTipOff, -4000
PatchExecuted := 1

GameIsRunning:
SetTimer, IsBorderlandsClosed, On

F9::
Sleep 150
while (1)
    {    
        WinActivate, ahk_class LaunchUnrealUWindowsClient
        WinWaitActive, ahk_class LaunchUnrealUWindowsClient
        WinShow, ahk_class LaunchUnrealUWindowsClient
        ImageSearch, Xpos, YPos, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *130 BL2Check2.png
        if errorlevel=0
        {
            Console := "Yes"
            break   ; stop the while if the image is found
        }
        if errorlevel=1
        {
            Console := "No"
            break   ; stop the while if the image is found
        }
    }
WinActivate, ahk_class LaunchUnrealUWindowsClient
WinWaitActive, ahk_class LaunchUnrealUWindowsClient
Sleep, 150
IfEqual, ConsoleKey, Tilde
    Send, ~
else
    Send, {F6}
Sleep, 50
SendRaw obj dump
Send {Space}
Send %Clipboard%
Send {Enter}
return

#IfWinActive ahk_class LaunchUnrealUWindowsClient
^F2::RapidFIre:=!RapidFire

#IfWinActive ahk_class LaunchUnrealUWindowsClient
*~LButton::
If RapidFire
    {
        while GetKeyState("LButton","P")
        {
           SendPlay, {Click}
           Sleep, %rapidfiredelay%
        }
    }
return


IsBorderlandsClosed:
If !ProcessExist("Borderlands2.exe")
    ExitApp

; Function-Section 
ProcessExist(Name){
	Process,Exist,%Name%
	return Errorlevel
}
