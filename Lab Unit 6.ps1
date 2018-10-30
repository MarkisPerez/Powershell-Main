

#This Function imports the Server list from the excel file
Function PullServerList{
    $servtest = Get-Content serverlist.csv #imports from the excel file
}

#This function pings the Url's from the server document
Function ServerPing{
    foreach($url in $servtest){ #tests for each object
        If($url -eq 'Servers'){continue} #if the object is called "Servers" it skips it

        Test-Connection "$url" #Tests the name of the object by pinging it

    }
}

#This Function holds the script for collecting the names and information on printers you can connect to.
Function PrinterInfo{ 
    Set-Location "C:\Users\Temp"  
    $PrintList = Get-Printer | Select-Object -Property Name #Retrieves the name property from the list of printers
    foreach($printer in $PrintList){ #loops for the amount of printers stored in $PrintList
        $name = $printer.Name #Assigns this variable the "Name" property value of whichever object it is on
        New-Item -ItemType 'Directory'-name "$name" #Creates a directory
        $PrintInfo = Get-Printer -Name "$name" | Format-List #Pulls more detailed information about each printer through the loop
        $Printinfo | Out-File -FilePath "C:\Users\Temp\$name\$name.json" #Creates a JSON file in the indicated Path.
    }
}