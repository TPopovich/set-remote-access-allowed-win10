@echo off
REM for user priv changes we run:
secedit /configure /cfg defltbase_min_super.inf /db defltbase.sdb /verbose

REM for firewall changes we run:
PowerShell -ExecutionPolicy Bypass -Command "Write-Output 'Calling main__repair_firewall_computer_login.ps1 to fix firewall'"
PowerShell -ExecutionPolicy Bypass -File .\main__repair_firewall_computer_login.ps1

