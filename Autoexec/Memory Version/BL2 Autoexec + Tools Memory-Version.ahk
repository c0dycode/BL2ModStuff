;Made by c0dycode
#Include <ClassMemory>
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

RapidFire := 0
PatchExecuted := 0
MenuScreen := 0

SetTimer, IsBorderlandsClosed, 5000
SetTimer, IsBorderlandsClosed, Off

IfNotExist, Autoexec.ini
{
    IniWrite, patch.txt, Autoexec.ini, Settings, patchname
    IniWrite, 8000, Autoexec.ini, Settings, delay
    IniWrite, 20, Autoexec.ini, Settings, RapidFireDelay
}
IfExist, Autoexec.ini
{
    IniRead, patchname, Autoexec.ini, Settings, patchname
    IniRead, delay, Autoexec.ini, Settings, delay, 8000
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
IfEqual, MenuScreen, 0
{
    Loop{
        CheckMenu()
        Sleep 50
        IfEqual, MenuScreen, 1
            break
        else 
            continue
    }
}
IfEqual, PatchExecuted, 0
{
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
}
PatchExecuted := 1

GameIsRunning:
SetTimer, IsBorderlandsClosed, On
return

#IfWinActive ahk_class LaunchUnrealUWindowsClient
F8::
CheckConsole()
Sleep, 150
IfEqual, ConsoleStatus, 0
    {
        IfEqual, ConsoleKey, Tilde
            Send, ~
        else
            Send, {F6}
    }
DllCall("Sleep",UInt,100)
SendRaw getall WillowPopulationDefinition Name
Send {Enter}
SendRaw getall AIPawnBalanceDefinition Name
Send {Enter}
return

#IfWinActive
F9::
WinActivate, ahk_class LaunchUnrealUWindowsClient
WinWaitActive, ahk_class LaunchUnrealUWindowsClient
Sleep, 150
CheckConsole()
Sleep, 150
IfEqual, ConsoleStatus, 0
    {
        IfEqual, ConsoleKey, Tilde
            Send, ~
        else
            Send, {F6}
    }
Sleep, 150
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
#IfWinActive

IsBorderlandsClosed:
If !ProcessExist("Borderlands2.exe")
    ExitApp

ToolTipOff:
SetTimer, ToolTipOff, Off
ToolTip

; Function-Section 
ProcessExist(Name){
	Process,Exist,%Name%
	return Errorlevel
}

CheckMenu(){
if (_ClassMemory.__Class != "_ClassMemory")
    msgbox class memory not correctly installed. Or the (global class) variable "_ClassMemory" has been overwritten

mem := new _ClassMemory("ahk_exe Borderlands2.exe", "", hProcessCopy) 
if !isObject(mem)
    msgbox failed to open a handle
if !hProcessCopy
    msgbox failed to open a handle. Error Code = %hProcessCopy%
    
global MenuScreen := mem.read(mem.BaseAddress + 0x0003D788, "UInt", 0x18)
}

CheckConsole(){
if (_ClassMemory.__Class != "_ClassMemory")
    msgbox class memory not correctly installed. Or the (global class) variable "_ClassMemory" has been overwritten

mem := new _ClassMemory("ahk_exe Borderlands2.exe", "", hProcessCopy) 
if !isObject(mem)
    msgbox failed to open a handle
if !hProcessCopy
    msgbox failed to open a handle. Error Code = %hProcessCopy%
    
global ConsoleStatus := mem.read(mem.BaseAddress + 0x01EABE70, "UInt", 0x5C8, 0x4A0, 0x44)
}