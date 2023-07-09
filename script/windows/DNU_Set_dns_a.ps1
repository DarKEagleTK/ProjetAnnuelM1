param
(
    [string]$srvName,
    [string]$domain,
    [string]$ttl
)

$OldObj = Get-DnsServerResourceRecord -Name "$srvName" -ZoneName "$domain" -RRType "A"
$NewObj = [ciminstance]::new($OldObj)
$NewObj.RecordType = [System.TimeSpan]::FromSeconds($ttl)
Set-DnsServerResourceRecord -NewInputObject $NewObj -OldInputObject $OldObj -ZoneName "$domain" -PassThru