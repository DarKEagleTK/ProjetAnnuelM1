param
(
    [string]$domain
)

$ErrorActionPreference = 'Continue'
New-ADOrganizationalUnit -Name "$domain" -Path "OU=DC=TGT,DC=LOCAL"
New-AcceptedDomain -Name "$domain" -DomainName $domain -DomainType Authoritative