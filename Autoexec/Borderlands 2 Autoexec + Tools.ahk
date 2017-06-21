;Made by c0dycode
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
#SingleInstance
#Persistent
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
SetWorkingDir %A_ScriptDir%
SetControlDelay -1
CoordMode, Pixel, Client
SetTitleMatchMode, 3
FileInstall, BL2Check.png, BL2Check.png, 1
FileInstall, BL2Check2.png, BL2Check2.png, 1

SetTimer, IsBorderlandsClosed, 5000

IfNotExist, Autoexec.ini
{
    IniWrite, patch.txt, Autoexec.ini, Settings, patchname
    IniWrite, 7000, Autoexec.ini, Settings, delay
}

IfExist, Autoexec.ini
{
    IniRead, patchname, Autoexec.ini, Settings, patchname
    IniRead, delay, Autoexec.ini, Settings, delay, 7000
}

Width := 1.15 * (A_ScreenWidth / 2) 
Height := A_ScreenHeight / 3

If !ProcessExist("Borderlands2.exe")
    Run, steam://rungameid/49520

else
    goto GameIsRunning

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
Send, {F6}
Send, exec{Space}
Send, %patchname%
Send, {Enter}
Send, {Escape}

GameIsRunning:
return


F9::
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
IfEqual, Console, No
    Send {F6}

Sleep, 50
SendRaw obj dump
Send {Space}
Send %Clipboard%
Send {Enter}

IsBorderlandsClosed:
If !ProcessExist("Borderlands2.exe")
    ExitApp

ProcessExist(Name){
	Process,Exist,%Name%
	return Errorlevel
}

