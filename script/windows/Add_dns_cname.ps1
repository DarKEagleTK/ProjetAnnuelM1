param
(
    [string]$srvName,
    [string]$alias,
    [string]$domain
)

Add-DnsServerResourceRecordCName -Name "$srvName" -HostNameAlias "$alias" -ZoneName "$domain"