'Script to select a random line from a file and send it as a Telegram message
'v 2.0 
'Includes error handling and an option to enable/disable logging.
'Removed force negative groupid to be compatible with newer group ids.
'Added error handing for missing Lines.txt file (handy for testing purposes)

Const ForReading = 1
Const logEnabled = True ' Set to False to disable logging

Dim outNumber, max, min, strLine, logFilePath, objFSO, objTextFile, logFile

' Logging setup
logFilePath = "ProcessLog.txt"
Set objFSO = CreateObject("Scripting.FileSystemObject")

If logEnabled Then
    ' Open log file for writing or appending
    If Not objFSO.FileExists(logFilePath) Then
        Set logFile = objFSO.CreateTextFile(logFilePath, True)
    Else
        Set logFile = objFSO.OpenTextFile(logFilePath, 8) ' Append mode
    End If
End If

' Initialize random number generator
max = 18
min = 0
Randomize
outNumber = (Int((max - min + 1) * Rnd + min))

' Log random number generation
If logEnabled Then logFile.WriteLine Now & " - Random number generated: " & outNumber

' Read random line from "Lines.txt"
On Error Resume Next
Set objTextFile = objFSO.OpenTextFile("Lines.txt", ForReading)
If Err.Number <> 0 Then
    ' Log the error and set default text if file not found or inaccessible
    If logEnabled Then logFile.WriteLine Now & " - Error opening Lines.txt: " & Err.Description
    strLine = "@}}>-----" ' Default text to send
    On Error GoTo 0
Else
    ' Skip lines up to the randomly selected one
    For i = 1 To outNumber
        objTextFile.ReadLine
    Next
    strLine = objTextFile.ReadLine & " " & outNumber
    objTextFile.Close
    On Error GoTo 0
    ' Log the line read
    If logEnabled Then logFile.WriteLine Now & " - Line read from file: " & strLine
End If

' Telegram setup
Const botID = "XXXXXXXXX:xxxaaaaa-bbbbbbbbb-cccccccccccccc"  
Const groupID = "#########" ' Adjust as needed (negative sign for groups if required)

' Create HTTP object for API request
Dim o
Set o = CreateObject("MSXML2.XMLHTTP")

Dim telegramURL
telegramURL = "https://api.telegram.org/bot" & botID & "/sendMessage?chat_id=" & groupID & "&text=" & strLine

' Log Telegram request
If logEnabled Then logFile.WriteLine Now & " - Sending request to Telegram: " & telegramURL

' Send message to Telegram
On Error Resume Next
o.open "GET", telegramURL, False
o.send

' Check for errors during the API request
If Err.Number = 0 Then
    If logEnabled Then logFile.WriteLine Now & " - Message sent successfully. Response: " & o.responseText
Else
    If logEnabled Then logFile.WriteLine Now & " - Error sending message. Error: " & Err.Description
End If
On Error GoTo 0

' Clean up resources
If logEnabled Then logFile.Close
Set o = Nothing
Set objTextFile = Nothing
Set logFile = Nothing
Set objFSO = Nothing
