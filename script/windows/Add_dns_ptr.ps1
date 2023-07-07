param
(
    [string]$srvName,
    [string]$subDomain,
    [string]$reverseIP
)

Add-DnsServerResourceRecordPtr -Name "$srvName" -ZoneName "$reverseIP.in-addr.arpa" -AllowUpdateAny -TimeToLive 01:00:00 -AgeRecord -PtrDomainName "$subDomain"