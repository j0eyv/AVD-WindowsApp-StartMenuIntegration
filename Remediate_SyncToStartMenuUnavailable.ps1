# Ensure the registry value exists and set it to 0
$RegPath = "HKLM:\SOFTWARE\Microsoft\WindowsApp"
$RegName = " SyncToStartMenuUnavailable"

if (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

Set-ItemProperty -Path $RegPath -Name $RegName -Value 0 -Type DWord