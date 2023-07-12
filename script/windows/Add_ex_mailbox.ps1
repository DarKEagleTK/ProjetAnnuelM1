param
(
    [string]$firstName,
    [string]$surName,
    [string]$domain,
    [string]$mailAlias,
    [SecureString]$password

)

$displayName = ($firstName + ' ' + $surName)
$mail = ($mailAlias + '@' + $domain).ToLower()
New-Mailbox -Name "$displayName" -UserPrincipalName $mail -Password (ConvertTo-SecureString -String "$password" -AsPlainText -Force) -FirstName $firstName -LastName $surName -OrganizationalUnit $domain