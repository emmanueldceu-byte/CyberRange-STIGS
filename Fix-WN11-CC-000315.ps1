<#
STIG: WN11-CC-000315
Disable Always Install with Elevated Privileges
Note: at the end, run :gpupdate /force
#>

Write-Host "Remediating WN11-CC-000315..." -ForegroundColor Green

# Machine Policy
$MachinePath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"

if (!(Test-Path $MachinePath)) {
    New-Item -Path $MachinePath -Force | Out-Null
}

Set-ItemProperty `
    -Path $MachinePath `
    -Name "AlwaysInstallElevated" `
    -Type DWord `
    -Value 0

# User Policy
$UserPath = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Installer"

if (!(Test-Path $UserPath)) {
    New-Item -Path $UserPath -Force | Out-Null
}

Set-ItemProperty `
    -Path $UserPath `
    -Name "AlwaysInstallElevated" `
    -Type DWord `
    -Value 0

Write-Host "Registry values configured." -ForegroundColor Yellow

# Force Group Policy Refresh
gpupdate /force

Write-Host "WN11-CC-000315 remediation complete." -ForegroundColor Green

<#
STIG: WN11-CC-000315
Disable Always Install with Elevated Privileges
Note: at the end, run :gpupdate /force
#>
