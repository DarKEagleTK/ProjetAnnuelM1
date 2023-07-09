param
(
    [string]$domain
)

Add-DnsServerPrimaryZone -Name $domain -ComputerName serv-PA-ad-001 -ReplicationScope Forest