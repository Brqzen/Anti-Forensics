Remove-Item "C:\Users\%username%\AppData\Roaming\discord\Local Storage\leveldb\*.ldb" -Force
Remove-Item "$env:AppData\AnyDesk" -Force
Remove-Item "$env:AppData\.minecraft\user*" -Force
Remove-Item "$env:AppData\.minecraft\launcher*" -Force
Remove-Item "$env:AppData\.minecraft\logs" -Force
Remove-Item "$env:AppData\.minecraft\clientId.txt" -Force
Remove-Item "$env:AppData\Badlion Client" -Force
Remove-Item "$env:AppData\lunarclient" -Force
pause
