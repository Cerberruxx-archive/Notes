# 1. DEFINE THE PATH (Example: The 'Run' key where apps start on boot)
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"

# 2. BACKUP: Export the key to a file before changing anything
# This creates a .reg file on your desktop
reg export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" "$env:USERPROFILE\Desktop\RunKeyBackup.reg"

# 3. QUERY: Look at what's currently inside that key
Get-ItemProperty -Path $registryPath

# 4. EXPLANATION:
# Get-ItemProperty is the 'Safe' command—it only READS.
# 'reg export' is your safety net. If you mess up, double-click the .reg file to fix it.
