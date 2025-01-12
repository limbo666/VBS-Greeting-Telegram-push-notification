1.  **Command-Line Argument Handling**:
    
    -   The script now checks for command-line arguments using `WScript.Arguments`.
    -   If an argument is passed, it's used as the message text.
    -   If no argument is provided, it defaults to `"Default message text."`.
2.  **Logging**:
    
    -   Logs the received parameter and the entire process (if `logEnabled = True`).
3.  **Default Behavior**:
    
    -   The script sends a predefined message if no parameter is provided.

----------

### Usage Example

#### Sending a Custom Message

Run the script with a parameter to send a custom message:

cmd

Copy code

`cscript SendToTelegram.vbs "This is the text to send"` 

#### Sending a Default Message

Run the script without parameters to send the default message:

cmd

Copy code

`cscript SendToTelegram.vbs`
