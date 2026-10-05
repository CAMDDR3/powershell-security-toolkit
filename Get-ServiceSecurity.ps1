# ============================================================
# PowerShell Security Toolkit
# Script: Get-ServiceSecurity.ps1
# Purpose: Audit Windows processes and services
# ============================================================

Clear-Host

Write-Host "========================================="
Write-Host "        SERVICE & PROCESS AUDIT          "
Write-Host "========================================="
Write-Host ""

Write-Host "RUNNING PROCESSES"
Write-Host "-----------------------------------------"

Get-Process |
    Sort-Object CPU -Descending |
    Select-Object -First 15 Name, Id, CPU |
    Format-Table -AutoSize

Write-Host ""
Write-Host "RUNNING SERVICES"
Write-Host "-----------------------------------------"

Get-Service |
    Where-Object { $_.Status -eq "Running" } |
    Select-Object Name, DisplayName, Status |
    Sort-Object Name |
    Format-Table -AutoSize

Write-Host ""
Write-Host "STOPPED AUTOMATIC SERVICES"
Write-Host "-----------------------------------------"

$stoppedAutomatic = Get-CimInstance Win32_Service |
    Where-Object {
        $_.StartMode -eq "Auto" -and
        $_.State -ne "Running"
    }

if ($stoppedAutomatic) {

    $stoppedAutomatic |
        Select-Object Name, DisplayName, State, StartMode |
        Format-Table -AutoSize

}
else {

    Write-Host "No stopped automatic services found."

}

Write-Host ""
Write-Host "SERVICE EXECUTABLE PATHS"
Write-Host "-----------------------------------------"

Get-CimInstance Win32_Service |
    Where-Object { $_.State -eq "Running" } |
    Select-Object Name, StartName, PathName |
    Format-Table -AutoSize

Write-Host ""
Write-Host "========================================="
Write-Host "       SERVICE AUDIT COMPLETE            "
Write-Host "========================================="
