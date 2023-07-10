param
(
    [string]$mail
)

New-MailboxExportRequest -Mailbox $mail -FilePath ("C:\Exports\" + "$mail" + ".pst")