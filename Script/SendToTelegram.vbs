Const ForReading = 1
Dim outNumber
Dim max,min
Dim strLine 

max=18
min=0
Randomize
outNumber= (Int((max-min+1)*Rnd+min))


Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objTextFile = objFSO.OpenTextFile("Lines.txt", ForReading)
For i = 1 to outNumber
    objTextFile.ReadLine
Next
strLine = objTextFile.ReadLine & " " & outNumber
''Wscript.Echo strLine
objTextFile.Close

outline=strLine

Const botID = "XXXXXXXXX:xxxaaaaa-bbbbbbbbb-cccccccccccccc"  
Const groupID = "#########"


Dim o
Set o = CreateObject("MSXML2.XMLHTTP")
o.open "GET", "https://api.telegram.org/bot" & botID & "/sendMessage?chat_id=-" & groupID & "&text=" & " " & outline, False
o.send
' o.responseText now holds the response as a string.
