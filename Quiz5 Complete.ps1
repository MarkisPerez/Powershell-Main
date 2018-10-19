#Ask a user to input a number and using if statements tell the user if it is higher or lower then a number you pick out.
#Using Get-Process get only the StartTime property and store it in a variable
#Using a loop print each line of the variable you stored the start times in, and have it print the start time each time the loop runs and a message telling the user what it is outputting.
#Using git make a local copy of this repository https://github.com/PowerShell/PowerShell

$compnum = read-host -Prompt 'Enter the number for the user to guess'

$usernum = read-host -prompt 'Enter your guess now'

if($usernum -lt $compnum){
Write-Output 'Higher'
}
elseif($usernum -gt $compnum){
Write-Output 'Lower'
}
elseif($usernum -eq $compnum){
Write-Output 'Bingo'
}

$StartTime = Get-process | Select-Object -Property StartTime

$StartTime | ForEach-Object{
    if($_ -eq $null){continue}
        Write-Output ' This is the start time of an individual process on this system. ' $_
   
}
