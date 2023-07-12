$securePassword = ConvertTo-SecureString -String "Toto12345" -AsPlainText -Force
$id = "TGT\administrateur"
$credential = New-Object System.Management.Automation.PSCredential($id, $securePassword)
Invoke-Command -ComputerName 10.1.0.12 -Credential $credential -ScriptBlock {param([string]$srvName, [string]$domain, [string]$ipAdd) Add-DnsServerResourceRecordA -Name "$srvName" -ZoneName "$domain" -AllowUpdateAny -IPv4Address "$ipAdd" -TimeToLive 01:00:00}