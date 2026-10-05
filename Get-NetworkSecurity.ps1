# ============================================================
# PowerShell Security Toolkit
# Script: Get-NetworkSecurity.ps1
# Purpose: Audit Windows network configuration and connections
# ============================================================

Clear-Host

Write-Host "========================================="
Write-Host "          NETWORK SECURITY AUDIT         "
Write-Host "========================================="
Write-Host ""

Write-Host "ACTIVE NETWORK ADAPTERS"
Write-Host "-----------------------------------------"

Get-NetAdapter |
    Where-Object { $_.Status -eq "Up" } |
    Select-Object Name, InterfaceDescription, Status, LinkSpeed |
    Format-Table -AutoSize

Write-Host ""
Write-Host "IP CONFIGURATION"
Write-Host "-----------------------------------------"

Get-NetIPAddress -AddressFamily IPv4 |
    Where-Object { $_.IPAddress -ne "127.0.0.1" } |
    Select-Object InterfaceAlias, IPAddress, PrefixLength |
    Format-Table -AutoSize

Write-Host ""
Write-Host "ACTIVE TCP CONNECTIONS"
Write-Host "-----------------------------------------"

Get-NetTCPConnection |
    Where-Object { $_.State -eq "Established" } |
    Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State |
    Format-Table -AutoSize

Write-Host ""
Write-Host "LISTENING TCP PORTS"
Write-Host "-----------------------------------------"

Get-NetTCPConnection |
    Where-Object { $_.State -eq "Listen" } |
    Select-Object LocalAddress, LocalPort, State |
    Sort-Object LocalPort |
    Format-Table -AutoSize

Write-Host ""
Write-Host "WINDOWS FIREWALL STATUS"
Write-Host "-----------------------------------------"

Get-NetFirewallProfile |
    Select-Object Name, Enabled, DefaultInboundAction, DefaultOutboundAction |
    Format-Table -AutoSize

Write-Host ""
Write-Host "========================================="
Write-Host "        NETWORK AUDIT COMPLETE           "
Write-Host "========================================="
