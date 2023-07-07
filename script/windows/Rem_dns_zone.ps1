param
(
    [string]$domain
)

Remove-DnsServerZone "$domain" -PassThru -Verbose