param
(
    [string]$priority,
    [string]$subDomain,
    [string]$domain
)

Add-DnsServerResourceRecordMX -Preference $priority  -Name "." -TimeToLive 01:00:00 -MailExchange "$subDomain" -ZoneName "$domain"