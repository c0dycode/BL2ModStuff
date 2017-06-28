;Made by c0dycode
;TODO:
;           - Read cli steam uses when using script as Launcher replacement
;           - Could be a decent Linux alternative to AHK: http://www.semicomplete.com/projects/xdotool/xdotool.xhtml
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

Loop, %0%  ; For each parameter
{
    launchparam .= %A_Index% " "  ; Get each launchparamter steam sends
}

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
    IniWrite, True, Autoexec.ini, Settings, Hexedited
}
IfExist, Autoexec.ini
{
    IniRead, patchname, Autoexec.ini, Settings, patchname
    IniRead, delay, Autoexec.ini, Settings, delay, 8000
    IniRead, rapidfiredelay, Autoexec.ini, Settings, RapidFireDelay, 20
    IniRead, Hexedited, Autoexec.ini, Settings, Hexedited, True
    IniRead, ConsoleKey, %A_MyDocuments%\My Games\Borderlands 2\WillowGame\Config\WillowInput.ini, Engine.Console, ConsoleKey
    
    IniWrite, %patchname%, Autoexec.ini, Settings, patchname
    IniWrite, %delay%, Autoexec.ini, Settings, delay
    IniWrite %rapidfiredelay%, Autoexec.ini, Settings, RapidFireDelay
    IniWrite %Hexedited%, Autoexec.ini, Settings, Hexedited
}
Width := 1.15 * (A_ScreenWidth / 2) 
Height := A_ScreenHeight / 3


If !ProcessExist("Borderlands2.exe")
{
    IfEqual, A_ScriptName, Launcher.exe
        Run, Borderlands2.exe %launchparam%
    else
        Run, steam://rungameid/49520
}
else
{
    IfEqual, PatchExecuted, 0
        goto RunAutoexec
    else
        goto GameIsRunning
}

RunAutoexec:
WinWait, ahk_class LaunchUnrealUWindowsClient,,3
WinWaitClose, ahk_class LaunchUnrealUWindowsClient,,3
WinWait, ahk_class LaunchUnrealUWindowsClient
Sleep, 1000
IfEqual, Hexedited, False
{
    ConsoleSay()
    UnlockSet()
    DevCommands()
}
Sleep, 1500
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
Sleep, 500
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
    
global ConsoleStatus := mem.read(mem.BaseAddress + 0x01EB5F70, "UInt", 0x310, 0x7B8, 0x3D0, 0xC, 0x56C)
}

DevCommands(){
if (_ClassMemory.__Class != "_ClassMemory")
    msgbox class memory not correctly installed. Or the (global class) variable "_ClassMemory" has been overwritten

mem := new _ClassMemory("ahk_exe Borderlands2.exe", "", hProcessCopy) 
if !isObject(mem)
    msgbox failed to open a handle
if !hProcessCopy
    msgbox failed to open a handle. Error Code = %hProcessCopy%

pattern := mem.hexStringToPattern("58 01 04 28")
devcommandsaddress := mem.processPatternScan(mem.BaseAddress,, pattern*)
mem.write(devcommandsaddress, 654573912, type := "UInt")
;~ MsgBox, dev: %devcommandsaddress%
}

ConsoleSay(){
if (_ClassMemory.__Class != "_ClassMemory")
    msgbox class memory not correctly installed. Or the (global class) variable "_ClassMemory" has been overwritten

mem := new _ClassMemory("ahk_exe Borderlands2.exe", "", hProcessCopy) 
if !isObject(mem)
    msgbox failed to open a handle
if !hProcessCopy
    msgbox failed to open a handle. Error Code = %hProcessCopy%

pattern := mem.hexStringToPattern("?? 00 61 00 79 00 20 00 00 00 00 00")
consayaddress := mem.processPatternScan(mem.BaseAddress,, pattern*)
DllCall("VirtualProtectEx", "UInt", hProcessCopy, "UInt", consayaddress, "UInt", 4, "UInt", 0x04, "UInt *", 0) ; Makes Memoryregion writable
mem.write(consayaddress, 0, type := "UInt")
mem.write(consayaddress + 0x04, 2097152, type := "UInt")
DllCall("VirtualProtectEx", "UInt", hProcessCopy, "UInt", consayaddress, "UInt", 4, "UInt", 0x02, "UInt *", 0) ; Memoryregion back to read-only
;~ MsgBox, con: %consayaddress%
}

UnlockSet(){
if (_ClassMemory.__Class != "_ClassMemory")
    msgbox class memory not correctly installed. Or the (global class) variable "_ClassMemory" has been overwritten

mem := new _ClassMemory("ahk_exe Borderlands2.exe", "", hProcessCopy) 
if !isObject(mem)
    msgbox failed to open a handle
if !hProcessCopy
    msgbox failed to open a handle. Error Code = %hProcessCopy%

pattern := mem.hexStringToPattern("83 C4 0C 85 C0 75 1A 6A")
unlocksetaddress := mem.processPatternScan(mem.BaseAddress,, pattern*)
mem.write(unlocksetaddress, 2232206467, type := "UInt")
mem.write(unlocksetaddress + 0x04, 1780119039, type := "UInt")
;~ MsgBox, set : %unlocksetaddress%
}