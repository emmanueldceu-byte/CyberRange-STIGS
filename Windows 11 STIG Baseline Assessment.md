Windows 11 STIG Compliance Assessment (Tenable)

Completed an initial DISA STIG compliance scan of a Windows 11 workstation using Tenable Vulnerability Management.

Results:
- Total Checks: 263
- Passed: 100
- Failed: 151
- Warnings: 12

Key findings include:
- BitLocker PIN requirements not configured
- Virtualization-Based Security (VBS) and DMA Protection disabled
- Multiple Windows Installer, Remote Desktop, WinRM, and PowerShell policy misconfigurations
- Missing audit policy settings
- Consumer experiences and AutoRun not disabled
- Legal notice banner not configured
- Several user rights assignments not compliant with STIG requirements

Remediation Plan:
1. Address critical  and higjvulnerabilities and priorities. 
2. Address low-effort Group Policy fixes (Windows Installer, AutoRun, WinRM, Consumer Experiences, RDP settings).
3. Configure required audit policies.


Current compliance status: 38% passed (100/263 checks).

# IMAGES#
<img width="917" height="604" alt="Screenshot (148)" src="https://github.com/user-attachments/assets/83bb3ebb-1ff7-44fb-8519-2ac723898630" />

<img width="920" height="604" alt="Screenshot (150)" src="https://github.com/user-attachments/assets/5521630b-baab-4590-aabc-593312dac8b2" />

<img width="920" height="604" alt="Screenshot (151)" src="https://github.com/user-attachments/assets/d5b81248-cb40-4a0c-9282-1dc39a78aaa1" />


