

Get-EventLog -Newest 5 -LogName "Application"

#change the computer name and username
Get-EventLog -LogName Security -ComputerName ComputerName -InstanceId 4624 | ?{$_.Message -like "*UserName*"}

#Counting login attemps with powershell for FailureAudit and SuccessAudit
Get-EventLog -LogName Security | Group-Object -Property -EntryType SuccessAudit



# Get the last 5 entry of an event id 4624
get-winevent -FilterHashtable @{Logname='Security';ID=4624}  -MaxEvents 10


#list of servers to see if there is an event ID in past 24 hours, save result on a file.
Get-Eventlog -LogName System -EntryType Error -after (Get-Date).AddHours(-24) -ID 4624 -ComputerName $server
$results = Get-Eventlog ....
if($results){".\script.ps1 *> Logins.txt"}
5. 

#get the 10 newest logs for each ID
5.$SecLog=Get-WinEvent -FilterHashTable @{Logname='Security';ID=4624} -Max 10
