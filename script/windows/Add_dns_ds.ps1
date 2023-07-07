param
(
    [string]$domain,
    [string]$srvName,
    [string]$name
)

Add-DnsServerResourceRecordDS -ZoneName "$domain" -Name "$name" -computerName serv-PA-ad-001