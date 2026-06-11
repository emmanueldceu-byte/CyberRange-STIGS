
# PowerShell Auto Remediation

```powershell
<#
STIG: WN11-CC-000110
Turn off printing over HTTP
#>

Write-Host "Applying WN11-CC-000110 remediation..." -ForegroundColor Green

$RegPath = "HKLM:\Software\Policies\Microsoft\Windows NT\Printers"

if (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

New-ItemProperty `
    -Path $RegPath `
    -Name "DisableHTTPPrinting" `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null

gpupdate /force

Write-Host "Remediation complete." -ForegroundColor Green
```

---

# Validation

## Method 1 - Verify Registry Setting

Run:

```powershell
Get-ItemProperty `
-Path "HKLM:\Software\Policies\Microsoft\Windows NT\Printers" `
-Name DisableHTTPPrinting
```

Expected Result:

```text
DisableHTTPPrinting : 1
```

---

## Method 2 - Verify Group Policy

Run:

```cmd
gpresult /h C:\Temp\GPReport.html
```

Open the report and verify:

```text
Computer Configuration
→ Administrative Templates
→ System
→ Internet Communication Management
→ Internet Communication settings
→ Turn off printing over HTTP

State: Enabled
```

---

## Method 3 - Tenable Validation

Apply policy:

```cmd
gpupdate /force
```

Re-run the compliance scan.

Expected Result:

```text
WN11-CC-000110 = Passed
```

---

# Registry Reference

```text
Registry Path:
HKLM\Software\Policies\Microsoft\Windows NT\Printers

Value Name:
DisableHTTPPrinting

Type:
REG_DWORD

Value:
1
```

A value of **1** corresponds to **"Turn off printing over HTTP = Enabled"**, satisfying the STIG requirement.
