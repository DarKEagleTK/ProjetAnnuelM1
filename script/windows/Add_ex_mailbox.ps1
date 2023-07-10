param
(
    [string]$firstName,
    [string]$surName,
    [string]$mail,
    [SecureString]$password

)

$displayName = ($surName + ' ' + $firstname)
New-Mailbox -Name "$displayName" -UserPrincipalName $mail -Password (ConvertTo-SecureString -String "$password" -AsPlainText -Force) -FirstName $firstName -LastName $surName