SubArray1  := {name: "081216A", time: 46}
SubArray2  := {name: "080516A", time: 39}
SubArray3  := {name: "080416A", time: 38}
SubArray4  := {name: "080316A", time: 37}
SubArray5  := {name: "080216A", time: 36}
SubArray6  := {name: "080116A", time: 35}
SubArray7  := {name: "073016A", time: 33}
SubArray8  := {name: "072916A", time: 32}
SubArray9  := {name: "072816A", time: 31}
SubArray10 := {name: "072716A", time: 30}
SubArray11 := {name: "072616A", time: 29}
SubArray12 := {name: "072516A", time: 28}
SubArray13 := {name: "072416A", time: 27}
SubArray14 := {name: "072216A", time: 25}
SubArray15 := {name: "072116A", time: 24}
SubArray16 := {name: "072016A", time: 23}
SubArray17 := {name: "071916A", time: 22}
SubArray18 := {name: "071816A", time: 21}
SubArray19 := {name: "071516A", time: 18}
SubArray20 := {name: "071316A", time: 16}
SubArray21 := {name: "071216A", time: 15}
SubArray22 := {name: "071116A", time: 14}
SubArray23 := {name: "071016A", time: 13}
SubArray24 := {name: "070916A", time: 12}
SubArray25 := {name: "070816A", time: 11}
SubArray26 := {name: "070716A", time: 10}
SubArray27 := {name: "070616A", time: 9}
SubArray28 := {name: "070516A", time: 8}
SubArray29 := {name: "070316Awm", time: 6}
SubArray30 := {name: "070116Awm", time: 4}
SubArray31 := {name: "063016Awm", time: 3}
SubArray32 := {name: "062916Awm", time: 2}
SubArray33 := {name: "062816Awm", time: 1}

Coordinates := {}
Coordinates.Push(SubArray1,SubArray2,SubArray3,SubArray4,SubArray5,SubArray6,SubArray7,SubArray8,SubArray9,SubArray10,SubArray11,SubArray12,SubArray13,SubArray14,SubArray15,SubArray16,SubArray17,SubArray18,SubArray19,SubArray20,SubArray21,SubArray22,SubArray23,SubArray24,SubArray25,SubArray26,SubArray27,SubArray28,SubArray29,SubArray30,SubArray31,SubArray32,SubArray33)

if WinExist("ahk_exe FilmTek.exe")
    WinActivate, ahk_exe FilmTek.exe
else
    Run, C:\Program Files (x86)\SCI\FilmTek\FilmTek.exe
WinWait,FilmTek SE, , 30

if ErrorLevel
{
		MsgBox, WinWait FilmTek (32) timed out
		return
}
WinActivate, ahk_exe FilmTek.exe
WinMaximize

for index, element in Coordinates
{
    OpenAnalyzeSave(element.name, element.time)
    Sleep 1000
}

;End of program!
MsgBox, Completed all analyses for 1A Center




;;;;;;
OpenAnalyzeSave(folderName, daysSinceOne){
    ;Selects the Save Data menu item
    MouseClick, left, 800, 500, 2
    Sleep 300
    Send !{u}
    Sleep 200
    Send {Left}
    Sleep 200
    Send {Enter}

    ;Waits until the "Save Data" popup opens
    WinWaitActive, Open Data, , 5
    if ErrorLevel
    {
        MsgBox, WinWait for save dialog box timed out.
        return
    }


    ;Sends file name
    Send C:\Users\dfryauf\Desktop\%folder%\%folderName%\Cu 1 Center.tar
    Send {Enter}

    Sleep 500

    MouseClick, left, 303, 66
    Sleep 5000

    MouseClick, left, 1610, 126
    Sleep 200
    Send ^c

    Sleep 500

    clipboard = %daysSinceOne%`t%clipboard%`n

    FileAppend, %clipboard%, C:\Users\dfryauf\Desktop\%folder%\output1ACenter.txt

}
