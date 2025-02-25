# Make a request as CURL for a nice API response
$IPaddress = Invoke-WebRequest -URI "https://ifconfig.me/ip"

# Define the log file path and structure
$LogFile = "$($env:LOCALAPPDATA)\ip_rotation.log"
$Date = Get-Date -UFormat "%d/%m/%Y"
$LogFormat = "[$Date] $IPaddress"

# Write log to file
If (!(Test-Path $LogFile)) {
    New-Item -Path $LogFile -ItemType File -Force
} Else {
    Add-Content -Path $LogFile -Value "[$Date] $IPaddress"
}
