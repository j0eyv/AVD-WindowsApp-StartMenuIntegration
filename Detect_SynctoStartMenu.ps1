# Combined Sync to Start Menu settings
$RegPath  = 'HKLM:\SOFTWARE\Microsoft\WindowsApp'
$Reg1Name = 'SyncToStartMenuUnavailable' # expected: 0
$Reg2Name = 'SyncToStartMenuConfig'      # expected: 17

if (-not (Test-Path $RegPath)) {
    Write-Output 'NotCompliant'
    exit 1
}

$val1 = (Get-ItemProperty -Path $RegPath -Name $Reg1Name -ErrorAction SilentlyContinue).$Reg1Name
$val2 = (Get-ItemProperty -Path $RegPath -Name $Reg2Name -ErrorAction SilentlyContinue).$Reg2Name

# Missing values => NotCompliant
if ($null -eq $val1 -or $null -eq $val2) {
    Write-Output 'NotCompliant'
    exit 1
}

# Both must match expectations
if (([int]$val1 -eq 0) -and ([int]$val2 -eq 17)) {
    Write-Output 'Compliant'
    exit 0
} else {
    Write-Output 'NotCompliant'
    exit 1
}
