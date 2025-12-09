# Detect if the registry value is not 0
$RegPath = "HKLM:\SOFTWARE\Microsoft\WindowsApp"
$RegName = "SyncToStartMenuUnavailable"

if (Test-Path $RegPath) {
    $Value = (Get-ItemProperty -Path $RegPath -Name $RegName -ErrorAction SilentlyContinue).$RegName
    if ($Value -eq 0) {
        Write-Output "Compliant"
        exit 0
    } else {
        Write-Output "NotCompliant"
        exit 1
    }
} else {
    Write-Output "NotCompliant"
    exit 1
    }
