# Printer Management Script by ALIILAPRO
Script to fix error code 0x0000011b on shared printer.


## Overview

This `Printer Management` script is a Windows batch script designed to automate two essential tasks related to printer management:
1. Adding a specific registry key (`RpcAuthnLevelPrivacyEnabled`) under `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print` to improve printer security or configuration.
2. Restarting the Windows **Print Spooler** service to resolve printer-related issues without needing to manually restart the service from the Services console.

The script comes with a simple menu interface, allowing users to choose between these tasks, and includes error handling to ensure that the tasks are performed correctly. It also ensures that the script runs with administrator privileges, a requirement for modifying the registry and restarting Windows services.

## Features

- **Add Registry Key**: Adds the `RpcAuthnLevelPrivacyEnabled` registry key with a DWORD value of `0`. This registry key is often used to configure printer security settings in certain environments.
- **Restart Print Spooler**: Stops and starts the **Print Spooler** service to refresh the printer environment, which is a common troubleshooting step for many printing issues.
- **Administrator Privileges Check**: The script checks if it is being run with administrator privileges. If not, it will prompt the user for elevated permissions and restart itself with administrator rights.
- **Error Handling**: If any error occurs while adding the registry key or restarting the Print Spooler service, the script will provide feedback to the user.

## How to Use

### Prerequisites
- **Administrator Privileges**: Since the script modifies system-level settings, it requires administrative privileges to run.
- **Windows Operating System**: The script is designed for Windows environments where managing printers and services is done via the registry and Windows services.

### Steps to Run

1. **Download the Script**: Save the script file as `printer_management.bat` on your local machine.
2. **Run the Script**: Right-click on the `.bat` file and select **Run as Administrator** (this step is necessary for the script to function properly).
3. **Choose an Option**: After launching, you will be presented with a menu. Choose one of the following options:
   - Press `1` to **Add the Registry Key** (`RpcAuthnLevelPrivacyEnabled`).
   - Press `2` to **Restart the Print Spooler** service.
   - Press `3` to **Exit** the program.

### Menu Options

#### 1. Add Registry Key (`RpcAuthnLevelPrivacyEnabled`)
- The script will attempt to add the registry key at:
   HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print

- It will create a `DWORD` value named `RpcAuthnLevelPrivacyEnabled` and set it to `0`. If the operation is successful, you'll receive a confirmation message. If an error occurs, an error message will be displayed.

#### 2. Restart Print Spooler
- This option stops and restarts the **Print Spooler** service, which is necessary to clear stuck print jobs or refresh printer settings. You will receive a message indicating whether the service was successfully stopped and restarted. Any errors will also be handled and displayed.

#### 3. Exit
- Closes the script.

### Error Handling
The script checks for errors during the registry modification and service restart processes. If any issue occurs (e.g., insufficient permissions, the service fails to start), the script will inform the user and not proceed further.

### Example Output

```plaintext
==============================================
=             Printer Management             =
=                                            =
=                by ALIILAPRO                =
==============================================
1. Add Registry Key (RpcAuthnLevelPrivacyEnabled)
2. Restart Print Spooler
3. Exit
=====================================
Enter your choice (1, 2, or 3): 1
Adding registry key...
Registry key added successfully.
```

## Important Notes

- **Running as Administrator**: The script must be run with administrator privileges because it needs to modify the system registry and manage Windows services.
- **Compatibility**: The script is designed to run on Windows operating systems only. Running it on any other platform will not work.
- **Purpose of `RpcAuthnLevelPrivacyEnabled`**: This registry key is often used to manage the authentication level for Remote Procedure Call (RPC) between the client and the print server. Setting it to `0` disables certain security features, so use this setting only if it is required in your environment.

## License

This script is open-source and free to use. Modify it according to your needs, but please give credit to the original author, **ALIILAPRO**.
