# PowerShell Auto Remediation

```powershell
<#
STIG: WN11-CC-000090
Configure Security Policy Processing
Process even if GPOs have not changed
#>

Write-Host "Applying WN11-CC-000090 remediation..." -ForegroundColor Green

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"

if (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Configure security policy processing
New-ItemProperty `
    -Path $RegPath `
    -Name "ProcessEvenIfGPOsHaveNotChanged" `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null

gpupdate /force

Write-Host "Remediation completed." -ForegroundColor Green
```

---

# Validation

## Method 1 - Registry Validation

Run:

```powershell
Get-ItemProperty `
-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
```

Expected result:

```text
ProcessEvenIfGPOsHaveNotChanged : 1
```

---

## Method 2 - GPResult

Run:

```cmd
gpresult /h C:\Temp\GPReport.html
```

Open the report and verify:

```text
Computer Configuration
→ Administrative Templates
→ System
→ Group Policy
→ Configure security policy processing

State: Enabled
Process even if the Group Policy objects have not changed: Enabled
```

---

## Tenable Rescan

After applying the setting:

```cmd
gpupdate /force
