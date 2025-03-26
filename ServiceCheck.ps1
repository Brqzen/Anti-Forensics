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
            sc config pcasvc start=auto
            sc config DPS start=auto
            sc config sysmain start=auto
            sc config eventlog start=auto
            sc config diagtrack start=auto
            sc config Searchindexer start=auto
            sc config BAM start=auto
            sc config Appinfo start=auto
            sc config dusmsvc start=auto
            sc config scheduler start=auto
            sc config cdpsvc start=auto
            sc config sgrmbroker start=auto
            Write-Host "Services enabled." 
        }
        "2" { 
            sc config pcasvc start=disabled
            sc config DPS start=disabled
            sc config sysmain start=disabled
            sc config eventlog start=disabled
            sc config diagtrack start=disabled
            sc config Searchindexer start=disabled
            sc config BAM start=disabled
            sc config Appinfo start=disabled
            sc config dusmsvc start=disabled
            sc config scheduler start=disabled
            sc config cdpsvc start=disabled
            sc config sgrmbroker start=disabled
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
        "0" { Write-Host "Exiting..."; break }
        default { Write-Host "Invalid choice, please select 0, 1, 2, or 3." }
    }

    Pause
} while ($true)
