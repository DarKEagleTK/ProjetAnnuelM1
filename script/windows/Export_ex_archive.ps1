$securePassword = ConvertTo-SecureString -String "Toto12345" -AsPlainText -Force
$id = "TGT\administrateur"
$credential = New-Object System.Management.Automation.PSCredential($id, $securePassword)
Invoke-Command -ComputerName 10.1.0.11 -Credential $credential -ScriptBlock {param([string]$mail) New-MailboxExportRequest -Mailbox $mail -FilePath ("C:\Exports\" + "$mail" + "_archive.pst") -IsArchive}