# 🛡️ PowerShell Security Toolkit

A modular Windows security auditing toolkit built with PowerShell to analyze system configuration, user accounts, network activity, Windows Security events, services, processes, and firewall status.

The project includes an interactive command-line interface that allows individual security modules to be executed or combined into a full Windows security audit.

## 🚀 Features

### Interactive Security Toolkit

`SecurityToolkit.ps1` provides a central interface for the entire project.

```text
=============================================
         POWERSHELL SECURITY TOOLKIT
=============================================

[1] System Information Audit
[2] Account Security Audit
[3] Network Security Audit
[4] Security Event Log Audit
[5] Service & Process Audit
[6] Run Full Security Audit
[7] Export Full Audit Report
[0] Exit
```

### 💻 System Information Audit

`Get-SystemInfo.ps1`

Collects Windows host information including:

- Computer and user information
- Windows edition and version
- OS architecture
- IPv4 configuration
- Windows Firewall status
- System information

### 👤 Account Security Audit

`Get-AccountSecurity.ps1`

Audits Windows accounts and administrative privileges.

Checks:

- Local user accounts
- Enabled and disabled accounts
- Local administrator membership
- Last logon information
- Password requirements

### 🌐 Network Security Audit

`Get-NetworkSecurity.ps1`

Analyzes network configuration and active connections.

Checks:

- Active network adapters
- IPv4 configuration
- Established TCP connections
- Listening TCP ports
- Windows Firewall profiles

### 🔐 Windows Security Event Analysis

`Get-SecurityEvents.ps1`

Analyzes Windows Security event logs for authentication activity.

Monitors:

- Event ID 4624 — Successful logons
- Event ID 4625 — Failed logons
- Event ID 4740 — Account lockouts
- Recent Windows Security events

### ⚙️ Service & Process Audit

`Get-ServiceSecurity.ps1`

Examines Windows processes and services.

Checks:

- Running processes
- Running services
- Automatic services that are not running
- Service accounts
- Service executable paths

### 📄 Security Report Generation

The toolkit can run all security modules and export the results into a timestamped text report for later analysis.

Generated reports are stored locally in the `Reports` directory and excluded from Git tracking to prevent host-specific security information from being published.

## 🛠️ Technologies & Concepts

- PowerShell
- Windows Administration
- Windows Security Event Logs
- TCP/IP
- Windows Firewall
- Windows Services
- Local Users and Groups
- CIM / WMI
- Security Auditing
- Endpoint Enumeration
- Git
- GitHub

## ▶️ Running the Toolkit

Run PowerShell as Administrator.

Navigate to the project directory:

```powershell
cd path\to\PowerShell-Security-Toolkit
```

Run:

```powershell
.\SecurityToolkit.ps1
```

Select the desired security audit from the interactive menu.

## 📂 Project Structure

```text
powershell-security-toolkit/
│
├── SecurityToolkit.ps1
├── Get-SystemInfo.ps1
├── Get-AccountSecurity.ps1
├── Get-NetworkSecurity.ps1
├── Get-SecurityEvents.ps1
├── Get-ServiceSecurity.ps1
├── .gitignore
└── README.md
```

## 🎯 Skills Demonstrated

This project demonstrates hands-on experience with:

- PowerShell scripting and automation
- Windows security auditing
- Windows system administration
- Network and TCP/IP analysis
- Authentication event analysis
- Account and privilege auditing
- Windows Firewall inspection
- Service and process enumeration
- Security report generation
- Modular scripting
- Git version control

## 🔒 Security & Privacy

Generated audit reports may contain hostnames, usernames, IP addresses, running services, network connections, and other host-specific information.

The `Reports/` directory is intentionally excluded from this repository through `.gitignore`.

This toolkit is intended for educational purposes and for auditing Windows systems that you own or are authorized to administer.

## 👤 Author

**Cameron Cook**

Computer Science Graduate | Cybersecurity Minor

Interested in Cybersecurity, Security Operations, IT Infrastructure, Networking, Cloud Security, and Security Automation.
