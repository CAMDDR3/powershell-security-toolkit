# ============================================================
# PowerShell Security Toolkit
# Author: Cameron Cook
# Purpose: Central interface for Windows security auditing
# ============================================================

$Host.UI.RawUI.WindowTitle = "PowerShell Security Toolkit"

function Show-Menu {

    Clear-Host

    Write-Host "============================================="
    Write-Host "         POWERSHELL SECURITY TOOLKIT"
    Write-Host "============================================="
    Write-Host ""
    Write-Host "[1] System Information Audit"
    Write-Host "[2] Account Security Audit"
    Write-Host "[3] Network Security Audit"
    Write-Host "[4] Security Event Log Audit"
    Write-Host "[5] Service & Process Audit"
    Write-Host "[6] Run Full Security Audit"
    Write-Host "[0] Exit"
    Write-Host ""
    Write-Host "============================================="
}

function Run-Module {

    param (
        [string]$ScriptName
    )

    $ScriptPath = Join-Path $PSScriptRoot $ScriptName

    if (Test-Path $ScriptPath) {

        & $ScriptPath

    }
    else {

        Write-Host ""
        Write-Host "ERROR: $ScriptName could not be found."
        Write-Host "Expected location: $ScriptPath"

    }
}

do {

    Show-Menu

    $choice = Read-Host "Select an option"

    switch ($choice) {

        "1" {
            Run-Module "Get-SystemInfo.ps1"
            Read-Host "`nPress Enter to return to the menu"
        }

        "2" {
            Run-Module "Get-AccountSecurity.ps1"
            Read-Host "`nPress Enter to return to the menu"
        }

        "3" {
            Run-Module "Get-NetworkSecurity.ps1"
            Read-Host "`nPress Enter to return to the menu"
        }

        "4" {
            Run-Module "Get-SecurityEvents.ps1"
            Read-Host "`nPress Enter to return to the menu"
        }

        "5" {
            Run-Module "Get-ServiceSecurity.ps1"
            Read-Host "`nPress Enter to return to the menu"
        }

        "6" {

            Clear-Host

            Write-Host "============================================="
            Write-Host "            RUNNING FULL AUDIT"
            Write-Host "============================================="

            Run-Module "Get-SystemInfo.ps1"
            Run-Module "Get-AccountSecurity.ps1"
            Run-Module "Get-NetworkSecurity.ps1"
            Run-Module "Get-SecurityEvents.ps1"
            Run-Module "Get-ServiceSecurity.ps1"

            Write-Host ""
            Write-Host "============================================="
            Write-Host "             FULL AUDIT COMPLETE"
            Write-Host "============================================="

            Read-Host "`nPress Enter to return to the menu"
        }

        "0" {

            Clear-Host
            Write-Host "PowerShell Security Toolkit closed."

        }

        default {

            Write-Host ""
            Write-Host "Invalid selection. Choose 0-6."
            Start-Sleep -Seconds 2

        }
    }

} while ($choice -ne "0")
