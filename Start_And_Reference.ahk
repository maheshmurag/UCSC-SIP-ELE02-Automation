if WinExist("ahk_exe FilmTek.exe")
    WinActivate, ahk_exe FilmTek.exe
else 
    Run, C:\Program Files\SCI\FilmTek\FilmTek.exe
WinWait,FilmTek SE, , 30

if ErrorLevel
{
		MsgBox, WinWait FilmTek (32) timed out
		return
}
WinActivate, ahk_exe FilmTek.exe
WinMaximize

SetRecipe()
Reference()

SetRecipe(){
	MouseClick, left, 1666, 554
	sleep, 500
	Send {Backspace}
	sleep, 500
	Send ;recipe name
	sleep, 500
	Send {Down}
	sleep, 500
	Send {Enter}
}

Reference(){
	MouseClick, left, 52, 82
}
