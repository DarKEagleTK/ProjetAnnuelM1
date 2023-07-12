$securePassword = ConvertTo-SecureString -String "Toto12345" -AsPlainText -Force
$id = "TGT\administrateur"
$credential = New-Object System.Management.Automation.PSCredential($id, $securePassword)
Invoke-Command -ComputerName 10.1.0.12 -Credential $credential -ScriptBlock {param([string]$srvName, [string]$domain, [string]$ttl) $OldObj = Get-DnsServerResourceRecord -Name "$srvName" -ZoneName "$domain" -RRType "A"
$NewObj = [ciminstance]::new($OldObj)
$NewObj.TimeToLive = [System.TimeSpan]::FromSeconds($ttl)
Set-DnsServerResourceRecord -NewInputObject $NewObj -OldInputObject $OldObj -ZoneName "$domain" -PassThru}