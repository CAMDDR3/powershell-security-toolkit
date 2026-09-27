# ============================================================
# PowerShell Security Toolkit
# Script: Get-SystemInfo.ps1
# Purpose: Collect basic Windows system and security information
# ============================================================

Clear-Host

Write-Host "========================================="
Write-Host "        WINDOWS SYSTEM INFORMATION       "
Write-Host "========================================="
Write-Host ""

# Computer information
$computerInfo = Get-ComputerInfo

Write-Host "Computer Name:" $env:COMPUTERNAME
Write-Host "Current User:" $env:USERNAME
Write-Host "Windows Edition:" $computerInfo.WindowsProductName
Write-Host "Windows Version:" $computerInfo.WindowsVersion
Write-Host "OS Architecture:" $computerInfo.OsArchitecture

Write-Host ""
Write-Host "========================================="
Write-Host "           NETWORK INFORMATION           "
Write-Host "========================================="
Write-Host ""

Get-NetIPAddress |
    Where-Object {
        $_.AddressFamily -eq "IPv4" -and
        $_.IPAddress -ne "127.0.0.1"
    } |
    Select-Object InterfaceAlias, IPAddress

Write-Host ""
Write-Host "========================================="
Write-Host "          WINDOWS FIREWALL STATUS        "
Write-Host "========================================="
Write-Host ""

Get-NetFirewallProfile |
    Select-Object Name, Enabled

Write-Host ""
Write-Host "========================================="
Write-Host "            SYSTEM UPTIME                "
Write-Host "========================================="
Write-Host ""

$os = Get-CimInstance Win32_OperatingSystem
$uptime = (Get-Date) - $os.LastBootUpTime

Write-Host "Last Boot:" $os.LastBootUpTime
Write-Host "Days Running:" $uptime.Days
Write-Host "Hours:" $uptime.Hours
Write-Host "Minutes:" $uptime.Minutes

Write-Host ""
Write-Host "System information collection complete."
