$destination = Read-Host "Specify destination host name or IP address "
$datetime = get-date -f yyyy-MM-dd
$hostname = (Get-WmiObject -Class Win32_ComputerSystem -Property Name).Name
$logonly="Y"
$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
$filelocation="$ScriptDir"+"\"+$hostname+"_ping_"+$destination+$datetime+".txt"

Do{
    If($logonly -notmatch '^[yn]$' ) { Write-Warning "Invalid Entry" }
    $logonly = Read-Host "Log to a file and Output to console? (Y/N) "
} While($logonly -notmatch '^[yn]$')

Write-Host "Default ping vaules: -count 999999 -delay 2"

if ($logonly -eq "y") { 
    write-host "Pinging host:"$destination". Log file location: "$filelocation -BackgroundColor Yellow -ForegroundColor Red
    test-connection $destination -count 999999 -delay 2 -Verbose | format-table @{n='TimeStamp';e={Get-Date}},@{Expression={$_.Address};Label='Destination'},IPV4aDDRESS,ResponseTime | tee-object -filepath $filelocation -Append 
}

else { 
    test-connection $destination -count 999999 -delay 2 -Verbose | format-table @{n='TimeStamp';e={Get-Date}},@{Expression={$_.Address};Label="Destination"},IPV4aDDRESS,ResponseTime 
}
