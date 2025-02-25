# Monitor Your Dynamic IP Address
Make a call to the [https://ifconfig.me](https://ifconfig.me) API append every record to disk.

```text
# %localappdata%/ip_rotation.log

[25/02/2025] 9x.65.xx.13x
[25/02/2025] 9x.65.xx.13x
```

## Running the Script
To run the script launch it through PowerShell as follows:

```bat
powershell.exe .\public_ip_address_monitor.ps1
```

## Running Automatically
If you wish to run it automatically create a `Scheduled Task`. Tweak the script below to your needs.

The arguments mean the following:
 * **/CREATE** -  Create a new scheduled task
 * **/SC** - Defines the interval on when the taskshould run
   * MINUTE
   * HOURLY
   * DAILY
   * WEEKLY
   * MONTHLY
   * etc.
 * **/TN** - The name of the task as shown in Task Manager
 * **/TR** - The command to run
 * **/ST** - The time to run the task (in 24 hours format).

```bat
SCHTASKS /CREATE /SC DAILY /ST 10:00 /TN "PersonalTasks\Monitor Public IP Address" /TR "powershell.exe -ExecutionPolicy Bypass -File '%USERPROFILE%\Documents\scripts\public_ip_address_monitor.ps1'"
```
