param
(
    [string]$domain
)

Add-DnsServerPrimaryZone -Name $domain -ComputerName serv-PA-ad-001 -ReplicationScope Forest

#Add-DnsServerPrimaryZone -Name testzone.mylab.local -ComputerName DC -ReplicationScope Forest