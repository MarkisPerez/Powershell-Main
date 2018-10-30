#This Function is used to determine a name for a folder you want to create and the path for it. 
Function FilePath{ 
    $FSFolder = Read-Host -Prompt 'Please enter a name for the fileserver folder.'
    $FSPath = $null
        while($FSPath -eq $null){
        $FSPath = read-host 'Enter the directory path.'
        if(-not (test-path $FSPath)){
              Write-host 'Path unknown, re-enter'
              $FSPath = $null
        }
    
    }
}

#This Function holds the host query to determine continuation of the script.
Function Proceed{
    $choice = read-host 'Do you want to proceed? [y/n]'
    while ($choice -ne 'y'){
        if($choice -eq 'n'){exit}
        Write-Output 'Do you wish to proced [y/n]'
    
    }
}

#This Function holds the script to individually multiply values stored in a variable.
Function InputMultiplier{
    [int[]]$num = 5,50,50,3,1

    $num | foreach-object{
        $multiplier = Read-Host -Prompt 'Enter a number'
        $num = $_ * $multiplier
        $num
    }
}

#This Function holds the script for creating a folder from a list of employees.
Function EmployeeList{
    Set-Location "C:\"
    New-Item -Path $FSPath -Name $FSFolder -Type "Directory"
    $empnamescsv = get-content employeelist.csv
    $empnamescsv = $empnamescsv.name.replace(' ','').tolower()

    foreach($emplistfix in $empnamescsv){
        New-Item -Path "$FSPath\$FSFolder" -ItemType "Directory" -Name "$emplistfix"
        New-Item -Path "$FSPath\$FSFolder\$emplistfix" -ItemType "File" -Name "Hello.txt" -Value "Hi, welcome the Manhattan Area Technical College INT Program!"
    }
}

#This Function holds the script to ping url's provided in an excel document. 
Function ServerTest{
    $servtest = Get-Content serverlist.csv #imports from the excel file
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