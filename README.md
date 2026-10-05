# 🛡️ PowerShell Security Toolkit

A Windows security auditing toolkit built with PowerShell to collect and analyze system, account, network, and security configuration information.

This project was created as a hands-on cybersecurity and system administration project to practice Windows security auditing, PowerShell automation, network analysis, and endpoint visibility.

## 🔍 Current Features

### 💻 System Information Audit

`Get-SystemInfo.ps1`

Collects information about the Windows host including:

- Computer name
- Current user
- Windows edition
- Windows version
- OS architecture
- IPv4 configuration
- Windows Firewall status
- System uptime

### 👤 Account Security Audit

`Get-AccountSecurity.ps1`

Audits local Windows accounts and administrative privileges.

Checks:

- Local user accounts
- Enabled and disabled accounts
- Local administrator membership
- Last logon information
- Password requirements
- Password expiration configuration

### 🌐 Network Security Audit

`Get-NetworkSecurity.ps1`

Examines network configuration and active network activity.

Checks:

- Active network adapters
- IPv4 configuration
- Established TCP connections
- Listening TCP ports
- Windows Firewall profiles
- Inbound and outbound firewall configuration

## 🛠️ Technologies

- PowerShell
- Windows
- TCP/IP
- Windows Firewall
- Windows Local Users and Groups
- CIM / WMI
- Git
- GitHub

## ▶️ Usage

Open PowerShell as Administrator.

Navigate to the directory containing the scripts:

```powershell
cd path\to\powershell-security-toolkit
