cmd /c "reg delete 'HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store' /f"
cmd /c "reg delete 'HKCR\Local Settings\Software\Microsoft\Windows\Shell' /f"

taskkill /f /im explorer.exe
net stop EventLog

Remove-Item "C:\Windows\Prefetch\*.pf"
Remove-Item "C:\Windows\System32\winevt\Logs\*.evtx"
Remove-Item "C:\Windows\appcompat\Programs\*"
Remove-Item "C:\Windows\appcompat\pca\*.txt"
Remove-Item "C:\Windows\System32\sru\SRUDB.dat"
Remove-Item "C:\ProgramData\NVIDIA Corporation\Drs\nvAppTimestamps"
Remove-Item "env:%temp%\*"
Remove-Item "env:%AppData%\Microsoft\Windows\Recent\*.lnk"
Remove-Item "env:%AppData%\Microsoft\Windows\Recent\CustomDestinations\*ms"
Remove-Item "env:%APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*ms"
Remove-Item "env:%AppData%\Microsoft\Windows\PowerShell\PSReadLine\*.txt"


Rundll32.exe apphelp.dll,ShimFlushCache
fsutil usn deleteJournal /d c:
fsutil usn deleteJournal /d d:
fsutil usn deleteJournal /d e:
fsutil usn deleteJournal /d f:
fsutil usn deleteJournal /d g:


Start-Process explorer.exe
net start EventLog
Pause
