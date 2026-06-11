# PowerShell Auto Remediation


```powershell
<#
STIG: WN11-CC-000197
Configure:
Computer Configuration >> Administrative Templates >>
Windows Components >> Cloud Content >>
Turn off Microsoft consumer experiences = Enabled
#>

Write-Host "Applying WN11-CC-000197 remediation..." -ForegroundColor Green

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"

if (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

New-ItemProperty `
    -Path $RegPath `
    -Name "DisableWindowsConsumerFeatures" `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null

gpupdate /force

Write-Host "WN11-CC-000197 remediation complete." -ForegroundColor Green
```

---

# Validation

## Method 1 - Verify Registry Setting

Run:

```powershell
Get-ItemProperty `
-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" `
-Name DisableWindowsConsumerFeatures
```

Expected Result:

```text
DisableWindowsConsumerFeatures : 1
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
→ Windows Components
→ Cloud Content
→ Turn off Microsoft consumer experiences

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
WN11-CC-000197 = Passed
```

---

# Registry Reference

```text
Registry Path:
HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent

Value Name:
DisableWindowsConsumerFeatures

Type:
REG_DWORD

Value:
1
```

The registry value **DisableWindowsConsumerFeatures = 1** corresponds to:

```text
Computer Configuration
→ Administrative Templates
→ Windows Components
→ Cloud Content
→ Turn off Microsoft consumer experiences = Enabled
```

```
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Force | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name "DisableWindowsConsumerFeatures" -PropertyType DWord -Value 1 -Force
gpupdate /force
```

which satisfies the STIG requirement.
