# VBS -  Send a welcome message to Telegram
This VBS script created to send push notification messages from Windows to Telegram using  BOT API. 
The example here created to send a telegram push notification every time the computer starts. This is acts a good morning greeting message and as a simple "alarm" in case someone started the computer while user absence.

## Block Diagram
![https://raw.githubusercontent.com/limbo666/VBS-Greeting-to-Telegram/main/push%20telegram.png?token=GHSAT0AAAAAABZ573EYOOBQ2YVAZCYBOXKAY2RBW5](https://raw.githubusercontent.com/limbo666/VBS-Greeting-to-Telegram/main/push%20telegram.png?token=GHSAT0AAAAAABZ573EYOOBQ2YVAZCYBOXKAY2RBW5A)

## The Script
A random seed is used to read a line from a text file. This line  in order to send different text every day. 
You have to alter the two constants `botID` and `groupID` 

## Start with Windows
To automatically execute it every time the computer starts, a shortcut to this script should be placed on startup folder. This should be under  `%appdata%\Microsoft\Windows\Start Menu\Programs\Startup` or  under `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp`

## Telegram
To create a bot contact Telegram's **BotFather** https://telegram.me/BotFather. 
To get `botID` and `groupID` refer to https://stackoverflow.com/questions/32423837/telegram-bot-how-to-get-a-group-chat-id
