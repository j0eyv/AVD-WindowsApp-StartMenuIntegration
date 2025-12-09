# Detect if the registry value is not 0
$RegPath = "HKLM:\SOFTWARE\SOFTWARE\Microsoft\WindowsApp"
$RegName = " SyncToStartMenuConfig"

if (Test-Path $RegPath) {
    $Value = (Get-ItemProperty -Path $RegPath -Name $RegName -ErrorAction SilentlyContinue).$RegName
    if ($Value -eq 17) {
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
