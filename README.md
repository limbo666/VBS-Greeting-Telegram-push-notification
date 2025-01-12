# VBS - Send a Welcome Message to Telegram

This VBS script is designed to send push notification messages from a Windows system to Telegram using the BOT API. The example provided here is configured to send a Telegram push notification every time the computer starts. It acts as a friendly "good morning" greeting and as a simple "alert" in case someone starts the computer during your absence.

## Updated Features

1.  **Improved Logging:**
    
    -   Logs every step of the process, including errors and successes.
    -   Easily toggle logging on or off using a constant variable (`logEnabled`).
    -   Logs include random number generation, message content, and API responses.
2.  **Error Handling:**
    
    -   If the `Lines.txt` file is missing or inaccessible, the script automatically sends a default message (`@}}>-----`) instead of terminating.
3.  **Easy Customization:**
    
    -   You can modify the `Lines.txt` file to include additional lines for random selection.
    -   Alter the constants `botID` and `groupID` with your bot's details.
4.  **Instructions for Retrieving `botID` and `chatID`:**
    
    -   Added detailed steps for obtaining the bot and chat IDs.

----------

## How It Works

1.  A random number generator selects a line from the `Lines.txt` file.
2.  The selected line is sent as a message to a Telegram bot.
3.  Logs are created for each step, including message content and Telegram API responses.
4.  If the `Lines.txt` file is missing, a default message (`@}}>-----`) is sent instead.

----------

## Required Files

1.  **`SendToTelegram.vbs`**: The script file for sending Telegram messages.
2.  **`Lines.txt`**: A text file containing the list of messages to randomly pick from.

Both files must be in the same directory for the script to work correctly.

----------

## Setup Instructions

### Step 1: Configure the Script

1.  **Edit Constants**:
    
    -   Update `botID` with your Telegram bot's API token.
    -   Update `groupID` with the chat ID (or group chat ID) where messages should be sent.
2.  **Modify Lines.txt**:
    
    -   Add or edit lines in the `Lines.txt` file to include custom messages.
    -   Increase the random number range (`max` variable) in the script to reflect the total number of lines.

----------

### Step 2: Start with Windows

To execute the script automatically when the computer starts:

1.  Create a shortcut to `SendToTelegram.vbs`.
2.  Place the shortcut in the **Startup Folder**:
    -   `%appdata%\Microsoft\Windows\Start Menu\Programs\Startup` (per user)
    -   Or, `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup` (all users)

----------

## How to Retrieve `botID` and `chatID`

### Step 1: Create a Telegram Bot

1.  Open Telegram and search for [BotFather](https://telegram.me/BotFather).
2.  Start a chat with BotFather and use the command `/newbot` to create a bot.
3.  Follow the instructions to name your bot and get the API token. This token is your `botID`.

### Step 2: Get the `chatID`

1.  Start a chat or add your bot to a group.
2.  Send any message to the bot or group.
3.  Use the Telegram Bot API to get updates:
    -   Open this URL in your browser, replacing `<botID>` with your bot's token:
        
        bash
        
        Copy code
        
        `https://api.telegram.org/bot<botID>/getUpdates` 
        
    -   Example:
        
             
        `https://api.telegram.org/bot123456789:ABCDEF1234567890/getUpdates` 
        
4.  Look for `"chat":{"id":<chatID>}` in the response. This is your `chatID`.
    -   **For groups**, the chat ID may have a negative sign (e.g., `-123456789`).
 
## Example Diagram
![https://github.com/limbo666/VBS-Greeting-Telegram-push-notification/blob/main/push%20telegram.png?raw=true](https://github.com/limbo666/VBS-Greeting-Telegram-push-notification/blob/main/push%20telegram.png?raw=true)

## Notes
* Ensure the system has an active internet connection for the script to communicate with Telegram's API.
* If logging is enabled (`logEnabled = True`), logs will be saved in `ProcessLog.txt`.
For further assistance or questions, refer to the Telegram Bot API Documentation.
