$choice = read-host 'Do you want to proceed? [y/n]'
while ($choice -ne 'y'){
    if($choice -eq 'n'){exit}
    Write-Output 'Do you wish to proced [y/n]'
}


$servtest = Get-Content serverlist.csv


$TestJob = {
    foreach($url in $servtest){
    If($url -eq 'Servers'){continue}
    
    Test-Connection "$url"
    Receive-Job
    }
}


Start-Job $TestJob
