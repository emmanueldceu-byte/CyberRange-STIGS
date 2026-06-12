# WN11-CC-000068 - PowerShell Remediation

## Overview

This PowerShell remediation configures the Windows policy **"Remote host allows delegation of non-exportable credentials"** to **Enabled** by setting the appropriate registry value.

## STIG Requirement

| Setting                                                     | Required Value |
| ----------------------------------------------------------- | -------------- |
| Remote host allows delegation of non-exportable credentials | Enabled        |

### Registry Configuration

| Registry Path                                                     | Value Name            | Type      | Value |
| ----------------------------------------------------------------- | --------------------- | --------- | ----- |
| `HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation` | `AllowProtectedCreds` | REG_DWORD | `1`   |

---

## PowerShell Remediation Script

```powershell
# WN11-CC-000068
# Remote host allows delegation of non-exportable credentials

$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation"
$ValueName = "AllowProtectedCreds"
$ValueData = 1

# Create registry path if it does not exist
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Configure policy setting
New-ItemProperty `
    -Path $RegistryPath `
    -Name $ValueName `
    -PropertyType DWord `
    -Value $ValueData `
    -Force | Out-Null

Write-Host "WN11-CC-000068 remediated successfully." -ForegroundColor Green
```

---

## Verification Script

```powershell
Get-ItemProperty `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation" `
    -Name "AllowProtectedCreds"
```

### Expected Output

```text
AllowProtectedCreds : 1
```

---

## Compliance Validation

The system is compliant when:

* Registry path exists:

  * `HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation`
* Registry value exists:

  * `AllowProtectedCreds`
* Registry data equals:

  * `1`

---

## Execution

Run PowerShell as Administrator and execute:

```powershell
.\Remediate-WN11-CC-000068.ps1
```

---

## Rollback (Optional)

To remove the configuration:

```powershell
Remove-ItemProperty `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation" `
    -Name "AllowProtectedCreds"
```

> Note: Removing the registry value returns the policy to a Not Configured state unless otherwise enforced through Group Policy.
