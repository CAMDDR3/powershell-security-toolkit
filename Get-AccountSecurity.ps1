# ============================================================
# PowerShell Security Toolkit
# Script: Get-AccountSecurity.ps1
# Purpose: Audit local Windows user accounts and administrators
# ============================================================

Clear-Host

Write-Host "========================================="
Write-Host "          ACCOUNT SECURITY AUDIT         "
Write-Host "========================================="
Write-Host ""

Write-Host "LOCAL USER ACCOUNTS"
Write-Host "-----------------------------------------"

Get-LocalUser |
    Select-Object Name, Enabled, LastLogon, PasswordRequired |
    Format-Table -AutoSize

Write-Host ""
Write-Host "LOCAL ADMINISTRATORS"
Write-Host "-----------------------------------------"

Get-LocalGroupMember -Group "Administrators" |
    Select-Object Name, ObjectClass, PrincipalSource |
    Format-Table -AutoSize

Write-Host ""
Write-Host "DISABLED ACCOUNTS"
Write-Host "-----------------------------------------"

$disabledUsers = Get-LocalUser |
    Where-Object { $_.Enabled -eq $false }

if ($disabledUsers) {
    $disabledUsers |
        Select-Object Name, Enabled, LastLogon |
        Format-Table -AutoSize
}
else {
    Write-Host "No disabled local accounts found."
}

Write-Host ""
Write-Host "PASSWORD CONFIGURATION"
Write-Host "-----------------------------------------"

Get-LocalUser |
    Select-Object Name, PasswordRequired, PasswordExpires |
    Format-Table -AutoSize

Write-Host ""
Write-Host "========================================="
Write-Host "        ACCOUNT AUDIT COMPLETE           "
Write-Host "========================================="
