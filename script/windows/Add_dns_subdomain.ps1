param
(
    [string]$subDomain
)

Add-DnsServerSecondaryZone -Name "$subDomain" -PassThru