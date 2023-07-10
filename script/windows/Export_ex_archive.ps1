param
(
    [string]$mail
)

New-MailboxExportRequest -Mailbox $mail -FilePath ("C:\Exports\" + "$mail" + "_archive.pst") -IsArchive