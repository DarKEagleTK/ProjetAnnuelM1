param
(
    [string]$srvName,
    [string]$domain
)

Add-DnsServerResourceRecordAAAA -Name "$srvName" -ZoneName "$domain" -AllowUpdateAny -TimeToLive 01:00:00