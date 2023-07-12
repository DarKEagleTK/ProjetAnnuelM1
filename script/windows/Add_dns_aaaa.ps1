$securePassword = ConvertTo-SecureString -String "Toto12345" -AsPlainText -Force
$id = "TGT\administrateur"
$credential = New-Object System.Management.Automation.PSCredential($id, $securePassword)
Invoke-Command -ComputerName 10.1.0.12 -Credential $credential -ScriptBlock {param([string]$srvName, [string]$domain) Add-DnsServerResourceRecordAAAA -Name "$srvName" -ZoneName "$domain" -AllowUpdateAny -TimeToLive 01:00:00}