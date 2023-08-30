# Organize Downloads By Extension
Walk over all files in the `Downloads` folder as set in your `environment`, create folders based on found `file extensions` and copy files over in their respective folder.
For example the script will copy `C:\Users\test\Downloads\document.pdf` to `C:\Users\test\Downloads\.pdf\document.pdf`.

## Running the Script
To run the script launch it through PowerShell as follows:

```bat
powershell.exe .\organize_downloads_by_extension.ps1
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
SCHTASKS /CREATE /SC DAILY /ST 10:00 /TN "PersonalTasks\Organize Downloads 3" /TR "powershell.exe -File '%USERPROFILE%\Documents\scripts\organize_downloads_by_extension.ps1'"
```
