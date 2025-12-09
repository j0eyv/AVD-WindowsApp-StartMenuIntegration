# Ensure the registry value exists and set it to 0
$RegPath = "HKLM:\SOFTWARE\Microsoft\WindowsApp"
$RegName = "SyncToStartMenuUnavailable"

if (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

Set-ItemProperty -Path $RegPath -Name $RegName -Value 0 -Type DWord

# Ensure the registry value exists and set it to desired value
#0: Setting toggle is unlocked and off, not syncing resources to the Start menu. Users can change the setting if desired.
#1: Setting toggle is unlocked and on, syncing resources to the Start menu. Users can change the setting if desired.
#16: Setting toggle is locked and off, not syncing user resources to the Start menu. Users can't change the setting.
#17: Setting toggle is locked and on, syncing resources to the Start menu. Users can't change the setting.

$RegPath = "HKLM:\SOFTWARE\Microsoft\WindowsApp"
$RegName = "SyncToStartMenuConfig"

if (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

Set-ItemProperty -Path $RegPath -Name $RegName -Value 17 -Type DWord