# ============================================================
# PowerShell Security Toolkit
# Script: Get-SecurityEvents.ps1
# Purpose: Analyze recent Windows Security event logs
# ============================================================

Clear-Host

Write-Host "========================================="
Write-Host "        SECURITY EVENT LOG AUDIT         "
Write-Host "========================================="
Write-Host ""

Write-Host "RECENT SECURITY EVENTS"
Write-Host "-----------------------------------------"

Get-WinEvent -LogName Security -MaxEvents 20 |
    Select-Object TimeCreated, Id, LevelDisplayName, ProviderName |
    Format-Table -AutoSize

Write-Host ""
Write-Host "SUCCESSFUL LOGINS - EVENT ID 4624"
Write-Host "-----------------------------------------"

Get-WinEvent -FilterHashtable @{
    LogName = 'Security'
    Id      = 4624
} -MaxEvents 10 -ErrorAction SilentlyContinue |
    Select-Object TimeCreated, Id, MachineName |
    Format-Table -AutoSize

Write-Host ""
Write-Host "FAILED LOGINS - EVENT ID 4625"
Write-Host "-----------------------------------------"

$failedLogins = Get-WinEvent -FilterHashtable @{
    LogName = 'Security'
    Id      = 4625
} -MaxEvents 10 -ErrorAction SilentlyContinue

if ($failedLogins) {

    $failedLogins |
        Select-Object TimeCreated, Id, MachineName |
        Format-Table -AutoSize

}
else {

    Write-Host "No recent failed login events found."

}

Write-Host ""
Write-Host "ACCOUNT LOCKOUTS - EVENT ID 4740"
Write-Host "-----------------------------------------"

$lockouts = Get-WinEvent -FilterHashtable @{
    LogName = 'Security'
    Id      = 4740
} -MaxEvents 10 -ErrorAction SilentlyContinue

if ($lockouts) {

    $lockouts |
        Select-Object TimeCreated, Id, MachineName |
        Format-Table -AutoSize

}
else {

    Write-Host "No recent account lockout events found."

}

Write-Host ""
Write-Host "========================================="
Write-Host "       SECURITY EVENT AUDIT COMPLETE     "
Write-Host "========================================="
