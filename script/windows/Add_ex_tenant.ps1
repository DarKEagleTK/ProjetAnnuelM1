$securePassword = ConvertTo-SecureString -String "Toto12345" -AsPlainText -Force
$id = "TGT\administrateur"
$credential = New-Object System.Management.Automation.PSCredential($id, $securePassword)
Invoke-Command -ComputerName (10.1.0.11, 10.1.0.12) -Credential $credential -ScriptBlock {param([string]$domain)
$ErrorActionPreference = 'Continue'
New-ADOrganizationalUnit -Name "$domain" -Path "OU=DC=TGT,DC=LOCAL" -ProtectedFromAccidentalDeletion $False
New-AcceptedDomain -Name "$domain" -DomainName $domain -DomainType Authoritative
New-EmailAddressPolicy -Name "$domain" -EnabledEmailAddressTemplates ("SMTP:" + "@" + "$domain") -RecipientContainer $domain -IncludedRecipients AllRecipients -Priority 10
Update-EmailAddressPolicy $domain}