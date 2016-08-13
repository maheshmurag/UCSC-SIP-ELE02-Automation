;Create date folder in main parent folder
FormatTime, CurrentDateTime, , MMddyy'A'
FileCreateDir, C:\Users\SCI\Desktop\%folder%\%CurrentDateTime%

if WinExist("ahk_exe FilmTek.exe")
    WinActivate, ahk_exe FilmTek.exe
else 
    Run, C:\Program Files (x86)\SCI\FilmTek\FilmTek.exe

WinWait,FilmTek SE, , 30
if ErrorLevel
{
	MsgBox, WinWait FilmTek (29) timed out
	return
}

for index, element in Coordinates
{
    MoveToXY(element.xCoord, element.yCoord)
    Measure(element.name)
    Sleep 500
}

;End of program!
MsgBox, Completed all 18 measurements

;Moves to a specified x and y position
MoveToXY(xVar, yVar){
    ;Opens the "Move to XY" menu item
   	Send !s
	Sleep 200
	Send {Right}
	Sleep 200
	Send {Down 4}
	Send {Enter}
    
    ;Enters xVar, yVar
	Sleep 500
	Send {Tab 5}
	Send {Delete 10}
	Send %xVar%
	Send {Tab}
	Send {Delete 10}
	Send %yVar%
    
    ;Presses "Move" and exits the "Move to XY" dialog
	Send {Tab 5}
	Send {Enter}
	Sleep 3000
	Send +{Tab 2}
	Send {Enter}
}

;Measures and saves recorded data to folder structure
Measure(name){
	MouseClick, left, 150, 82
	
	;Waits for appearance of popup window which signifies end of measurement
	WinWait,Table [SINGLE POINT DATA], , 30
	if ErrorLevel
	{
		MsgBox, WinWait Data (77) timed out
		return
	}

    ;Closes the popup window
	IfWinExist, Table [SINGLE POINT DATA]
		WinClose
		WinActivate, ahk_exe FilmTek.exe
	
	Sleep 500
	
	;Selects the Save Data menu item
	MouseClick, left, 800, 500, 2
	Sleep 300	
	Send !{u}
	Sleep 200
	Send {Left}
	Sleep 200
	Send {Down 6}
	Sleep 200
	Send {Enter}
	
    ;Waits until the "Save Data" popup opens
	WinWaitActive, Save Data, , 5
	if ErrorLevel
	{
	    MsgBox, WinWait for save dialog box timed out.
	    return
	}	
	
    ;Sends file name
	Send %name%
	
	;Navigates to the correct folder in the file structure and saves the file
	MouseClick, left, 300, 50
	Sleep 500
	FormatTime, datevar, , MMddyy'A'
	Send C:\Users\SCI\Desktop\%folder%\%datevar%
	Sleep 500
	Send {Enter}
	Sleep 500
	Send +{Tab 2}
	Sleep 500
	Send {Enter}
	Sleep 500
   	WinActivate, ahk_exe FilmTek.exe
  	Sleep 500
	MouseClick, left, 800, 500, 2
}
