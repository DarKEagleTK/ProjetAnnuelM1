$securePassword = ConvertTo-SecureString -String "Toto12345" -AsPlainText -Force
$id = "TGT\administrateur"
$credential = New-Object System.Management.Automation.PSCredential($id, $securePassword)
Invoke-Command -ComputerName 10.1.0.12 -Credential $credential -ScriptBlock {param([string]$priority, [string]$subDomain, [string]$domain) Add-DnsServerResourceRecordMX -Preference $priority  -Name "." -TimeToLive 01:00:00 -MailExchange "$subDomain" -ZoneName "$domain"}