Write-Host "Clearing Registry"
reg delete "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f
reg delete "HKCR\Local Settings\Software\Microsoft\Windows\Shell" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f


taskkill /f /im explorer.exe
net stop EventLog

Write-Host "Clearing Files"
Remove-Item "C:\Windows\Prefetch\*.pf"
Remove-Item "C:\Windows\System32\winevt\Logs\*.evtx"
Remove-Item "C:\Windows\appcompat\pca\*.txt"
Remove-Item "C:\Windows\System32\sru\SRUDB.dat"
Remove-Item "C:\ProgramData\NVIDIA Corporation\Drs\nvAppTimestamps"
Remove-Item "env:%temp%\*"
Remove-Item "env:%AppData%\Microsoft\Windows\Recent\*.lnk"
Remove-Item "env:%AppData%\Microsoft\Windows\Recent\CustomDestinations\*ms"
Remove-Item "env:%AppData%\Microsoft\Windows\Recent\AutomaticDestinations\*ms"
Remove-Item "env:%AppData%\Microsoft\Windows\PowerShell\PSReadLine\*.txt"


Rundll32.exe apphelp.dll,ShimFlushCache
$drives = Get-WmiObject Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }
foreach ($drive in $drives) {
    $driveLetter = $drive.DeviceID
    Write-Host "Deleting USN journal on $driveLetter"
    fsutil usn deleteJournal /d $driveLetter
}


Start-Process explorer.exe
net start EventLog
Pause
