param
(
    [string]$domain
)

$ErrorActionPreference = 'Continue'
New-ADOrganizationalUnit -Name "$domain" -Path "OU=DC=TGT,DC=LOCAL" -ProtectedFromAccidentalDeletion $False
New-AcceptedDomain -Name "$domain" -DomainName $domain -DomainType Authoritative
New-EmailAddressPolicy -Name "$domain" -EnabledEmailAddressTemplates ("SMTP:" + "@" + "$domain") -RecipientContainer $domain -IncludedRecipients AllRecipients -Priority 10
Update-EmailAddressPolicy $domain