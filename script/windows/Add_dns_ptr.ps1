$securePassword = ConvertTo-SecureString -String "Toto12345" -AsPlainText -Force
$id = "TGT\administrateur"
$credential = New-Object System.Management.Automation.PSCredential($id, $securePassword)
Invoke-Command -ComputerName 10.1.0.12 -Credential $credential -ScriptBlock {param([string]$srvName, [string]$subDomain, [string]$reverseIP) Add-DnsServerResourceRecordPtr -Name "$srvName" -ZoneName "$reverseIP.in-addr.arpa" -AllowUpdateAny -TimeToLive 01:00:00 -AgeRecord -PtrDomainName "$subDomain"}