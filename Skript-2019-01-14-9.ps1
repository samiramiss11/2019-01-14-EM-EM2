

Get-EventLog -Newest 5 -LogName "Application"

#get evenlog from my PC the (i didnt check this command my copmputer name remain -ComputerName ComputerName in this command
Get-EventLog -LogName Security -ComputerName ComputerNamesamira -InstanceId 4624 | ?{$_.Message -like "*UserName*"}

#Counting login attemps with powershell for FailureAudit and SuccessAudit
Get-EventLog -LogName Security | Group-Object -Property -EntryType SuccessAudit



# Get the last 5 entry of an event id 4624
get-winevent -FilterHashtable @{Logname='Security';ID=4624}  -MaxEvents 10


#Make a list of servers to see if there is an event ID in past 24 hours, save result on a file.
Get-Eventlog -LogName System -EntryType Error -after (Get-Date).AddHours(-24) -ID 4624 -ComputerName  $server
$results = Get-Eventlog ....
if($results){".\script.ps1 *> C:\Temp\Logsinfo.txt"}


#get the 10 newest logs for each ID
$SecLog=Get-WinEvent -FilterHashTable @{Logname='Security';ID=4624} -Max 10

get-eventlog security -newest 100 |
  where \{$_.entrytype -eq `
    "SuccessAudit" "FailureAudit"\}








these are what i tried to collect from google 

Get-EventLog -LogName Security -InstanceID 4624 -EntryType SuccessAudit | measure | Out-File -FilePath C:\temp\Loginfo.txt -Encoding default

Get-EventLog "Security" | Where -FilterScript {$_.EventID -eq 4624 -and $_.ReplacementStrings[8] -eq 2} | Out-File -FilePath C:\temp\Loginfo.txt -Encoding default -Append

Get-EventLog "Security" | Where -FilterScript {$_.EventID -eq 4624 -and $_.ReplacementStrings[8] -eq 3} | Out-File -FilePath C:\temp\Loginfo.txt -Encoding default -Append

Get-EventLog "Security" | Where -FilterScript {$_.EventID -eq 4624 -and $_.ReplacementStrings[8] -eq 7} | Out-File -FilePath C:\temp\Loginfo.txt -Encoding default -Append

Get-EventLog -LogName Security -InstanceID 4625 -EntryType FailureAudit | Out-File -FilePath C:\temp\Logins.txt -Encoding default -Append
