#Requires AutoHotkey v2.0

Suspend 1
InstallKeybdHook
#SingleInstance Force
SendMode "Input"
#UseHook
#MaxThreads 1
SetCapsLockState "AlwaysOff"

Speed := 25


full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try
    {
        if A_IsCompiled
            Run '*RunAs "' A_ScriptFullPath '" /restart'
        else
            Run '*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"'
    }
    ExitApp
}

#HotIf GetKeyState("Alt")
    ;; mouse mode
	` & z::global Speed := 5
	` & a::global Speed := 25
	` & q::global Speed := 125
	` & 1::global Speed := 625
	` & e::MouseMove 0,-Speed,50,"R"
	` & s::MouseMove -Speed,0,50,"R"
	` & d::MouseMove 0,Speed,50,"R"
	` & f::MouseMove Speed,0,50,"R"
	
	` & w::Send "{LButton}"
	` & r::Send "{RButton}"

	
	` & t::Send "{WheelUp}"
	` & g::Send "{WheelDown}"
	` & v::Send "{WheelLeft}"
	` & b::Send "{WheelRight}"
	
	` & x::Send "{XButton1}"
	` & c::Send "{XButton2}"
	` & 3::Send "{MButton}"
#HotIf 

;; mirrored ++

!/::global Speed:=5
!;::global Speed:=25
!p::global Speed:=125
!0::global Speed:=625

!i::MouseMove 0,-Speed,50,"R"
!j::MouseMove -Speed,0,50,"R"
!k::MouseMove 0,Speed,50,"R"
!l::MouseMove Speed,0,50,"R"

!u::Send "{LButton}"
!o::Send "{RButton}"

!y::Send "{WheelUp}"
!h::Send "{WheelDown}"
!n::Send "{WheelLeft}"
!m::Send "{WheelRight}"

!,::Send "{XButton1}"
!.::Send "{XButton2}"
!8::Send "{MButton}"

!*w::[
!*r::]


!*e::Send "{Up}"
!*s::Send "{Left}"
!*d::Send "{Down}"
!*f::Send "{Right}"
!*t::Send "{PgUp}"
!*g::Send "{PgDn}"
!*x::Send "{Home}"
!*c::Send "{End}"

;; mirrored layout
*`::'

*1::6
*2::7
*3::8
*4::9
*5::0
*6::return
*7::return
*8::return
*9::return
*0::return

*q::p
*w::o
*e::i
*r::u
*t::y
*y::PgUp
*u::[
*i::Up
*o::]
*p::return

*a::;
*s::l
*d::k
*f::j
*g::h
*h::PgDn
*j::Left
*k::Down
*l::Right
*;::return

*z::/
*x::.
*c::,
*v::m
*b::n
*n::-
*m::=
*,::Home
*.::End
*/::return


#SuspendExempt
*CapsLock::Suspend
#SuspendExempt False

*Tab::
{
Suspend 1
Send "{Enter}"
}

LCtrl::Backspace


~*Backspace::
~*Esc::
~*Space::
~*Enter::Suspend 1