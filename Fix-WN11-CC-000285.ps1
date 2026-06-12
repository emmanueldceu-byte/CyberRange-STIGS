# WN11-CC-000285 - Require secure RPC communication (Enable)

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
$valueName = "fEncryptRPCTraffic"
$valueData = 1

# Ensure registry path exists
if (!(Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set policy value
New-ItemProperty -Path $regPath `
    -Name $valueName `
    -Value $valueData `
    -PropertyType DWord `
    -Force | Out-Null

Write-Host "Successfully enabled 'Require secure RPC communication' (WN11-CC-000285)." -ForegroundColor Yellow

# Verification code
Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" `
-Name fEncryptRPCTraffic
