# Enable Remote Desktop for all users
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" -Value 0

# Allow connections through Windows Firewall
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

#------------------------------------------------ CMD
# From CMD rather than powershell you can use::
# reg add "\HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
# netsh advfirewall firewall set rule group="Remote Desktop" new enable=Yes
#------------------------------------------------

#------------------------------------------------
# from another system to test do:
# Test-NetConnection wks10 -Port 3389
# -- or use this script --
# if ((Test-NetConnection wks10 -Port 3389).TcpTestSucceeded) { echo "rdp is open"; }
#------------------------------------------------

#------------------------------------------------
# All machine admisitrators can RDP,
# to add people not in the Administrators group to all RDP, add to the remote desktop group:
# net localgroup "remote desktop users" /add "username”
#------------------------------------------------
