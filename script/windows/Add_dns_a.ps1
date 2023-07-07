param
(
    [string]$srvName,
    [string]$zoneName,
    [string]$ipAdd
)

Add-DnsServerResourceRecordA -Name "$srvName" -ZoneName "$domain" -AllowUpdateAny -IPv4Address "$ipAdd" -TimeToLive 01:00:00