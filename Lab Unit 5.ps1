$FSFolder = Read-Host -Prompt 'Please enter a name for the fileserver folder.'
$FSPath = $null
while($FSPath -eq $null){
    $FSPath = read-host 'Enter the directory path.'
    if(-not (test-path $FSPath)){
        Write-host 'Path unknown, re-enter'
        $FSPath = $null
    }
}

$choice = read-host 'Do you want to proceed? [y/n]'
while ($choice -ne 'y'){
    if($choice -eq 'n'){exit}
    Write-Output 'Do you wish to proced [y/n]'
}

[int[]]$num = 5,50,50,3,1

$num | foreach-object{
$multiplier = Read-Host -Prompt 'Enter a number'
$num = $_ * $multiplier
$num
}

Set-Location "C:\"
New-Item -Path $FSPath -Name $FSFolder -Type "Directory"
$empnamescsv = get-content employeelist.csv
$empnamescsv = $empnamescsv.name.replace(' ','').tolower()

foreach($emplistfix in $empnamescsv){
New-Item -Path "$FSPath\$FSFolder" -ItemType "Directory" -Name "$emplistfix"
New-Item -Path "$FSPath\$FSFolder\$emplistfix" -ItemType "File" -Name "Hello.txt" -Value "Hi, welcome the Manhattan Area Technical College INT Program!"
}

$servtest = Get-Content serverlist.csv
foreach($url in $servtest){
If($url -eq 'Servers'){continue}

Test-Connection "$url"

}
