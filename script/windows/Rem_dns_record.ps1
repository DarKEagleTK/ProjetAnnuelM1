param
(
    [string]$domain
)

Remove-DnsServerResourceRecord -Force -ZoneName "$domain"