do {
    Clear-Host
    Write-Host "Select an option:"
    Write-Host "1 - Enable Services"
    Write-Host "2 - Disable Services"
    Write-Host "3 - Check Services"
    Write-Host "0 - Exit"

    $choice = Read-Host "Enter 0, 1, 2, or 3"

    switch ($choice) {
        "1" { 
            sc.exe config pcasvc start=auto
            sc.exe config DPS start=auto
            sc.exe config sysmain start=auto
            sc.exe config eventlog start=auto
            sc.exe config diagtrack start=auto
            sc.exe config Searchindexer start=auto
            sc.exe config BAM start=auto
            sc.exe config Appinfo start=auto
            sc.exe config dusmsvc start=auto
            sc.exe config scheduler start=auto
            sc.exe config cdpsvc start=auto
            sc.exe config sgrmbroker start=auto
            Write-Host "Services enabled." 
        }
        "2" { 
            sc.exe config pcasvc start=disabled
            sc.exe config DPS start=disabled
            sc.exe config sysmain start=disabled
            sc.exe config eventlog start=disabled
            sc.exe config diagtrack start=disabled
            sc.exe config Searchindexer start=disabled
            sc.exe config BAM start=disabled
            sc.exe config Appinfo start=disabled
            sc.exe config dusmsvc start=disabled
            sc.exe config scheduler start=disabled
            sc.exe config cdpsvc start=disabled
            sc.exe config sgrmbroker start=disabled
            Write-Host "Services disabled." 
        }
        "3" { 
            get-service | findstr -i "pcasvc"
            get-service | findstr -i "DPS"
            get-service | findstr -i "sysmain"
            get-service | findstr -i "eventlog"
            get-service | findstr -i "diagtrack"
            get-service | findstr -i "SearchIndexer"
            get-service | findstr -i "BAM"
            get-service | findstr -i "Appinfo"
            get-service | findstr -i "dusmsvc"
            get-service | findstr -i "scheduler"
            get-service | findstr -i "SgrmBroker"
            get-service | findstr -i "cdpsvc"
        }
        "0" { Write-Host "Exiting..."; return 0 }
        default { Write-Host "Invalid choice, please select 0, 1, 2, or 3." }
    }
pause
} while ($true)



