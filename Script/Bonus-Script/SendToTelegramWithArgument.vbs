' This is a simplified script to send a message to telegram using a bot by passing the string as an argument
'


Const ForReading = 1
Dim objArgs, messageText
Dim logEnabled, logFilePath, objFSO, logFile
Dim botID, groupID, telegramURL
Dim o

' Enable or disable logging
logEnabled = True
logFilePath = "ProcessLog.txt"

' Initialize logging
Set objFSO = CreateObject("Scripting.FileSystemObject")
If logEnabled Then
    If Not objFSO.FileExists(logFilePath) Then
        Set logFile = objFSO.CreateTextFile(logFilePath, True)
    Else
        Set logFile = objFSO.OpenTextFile(logFilePath, 8) ' Append mode
    End If
End If

' Retrieve command-line arguments
Set objArgs = WScript.Arguments
If objArgs.Count > 0 Then
    messageText = objArgs(0) ' Use the first parameter as the message text
Else
    messageText = "@}}>-----" ' Default message if no parameter is provided
End If

' Log the message text
If logEnabled Then logFile.WriteLine Now & " - Message text: " & messageText

' Telegram bot and group configuration
Const botID = "XXXXXXXXX:xxxaaaaa-bbbbbbbbb-cccccccccccccc"  
Const groupID = "#########" ' Adjust as needed (negative sign for groups if required)

' Build Telegram API request URL
telegramURL = "https://api.telegram.org/bot" & botID & "/sendMessage?chat_id=" & groupID & "&text=" & messageText

If logEnabled Then logFile.WriteLine Now & " - Sending request to Telegram: " & telegramURL

' Send the message
On Error Resume Next
Set o = CreateObject("MSXML2.XMLHTTP")
o.open "GET", telegramURL, False
o.send

' Log the result
If Err.Number = 0 Then
    If logEnabled Then logFile.WriteLine Now & " - Message sent successfully. Response: " & o.responseText
Else
    If logEnabled Then logFile.WriteLine Now & " - Error sending message. Error: " & Err.Description
End If
On Error GoTo 0

' Clean up
If logEnabled Then logFile.Close
Set o = Nothing
Set objArgs = Nothing
Set logFile = Nothing
Set objFSO = Nothing
