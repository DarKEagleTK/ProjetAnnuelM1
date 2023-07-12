$securePassword = ConvertTo-SecureString -String "Toto12345" -AsPlainText -Force
$id = "TGT\administrateur"
$credential = New-Object System.Management.Automation.PSCredential($id, $securePassword)
Invoke-Command -ComputerName 10.1.0.12 -Credential $credential -ScriptBlock {
## blog.schmitouille.net
## Script amÃ©liorÃ© de listing d'enregistrements DNS

##Write-Host "============================================="
##Write-Host "DNS records listing script - Enhanced Version"
##Write-Host "============================================="
$lfseq = Read-Host "Character sequence to look for ('*' tokens accepted)" ## demande de la chaîne de caractères à rechercher dans les noms d'enregistrements DNS
$today = Get-Date -f yyyyMMdd ## gestion de la date pour le nom de fichier
$path = "dns-$today.csv" ## fichier csv de sortie
$csvheader = "Hostname,Zone,RecordType,RecordData" ## colonnes définies dans le fichier CSV
Add-Content -Value $csvheader -Path $path ## écriture des colonnes dans le fichier CSV
##Write-Host "Connecting to DNS Server and retrieving DNS zones"
$dnszones = Get-DNSServerZone -ComputerName serv-PA-ad-001 | Where-Object {$_.IsReverseLookupZone -eq $false} ## on récupère les zones DNS disponibles sur le serveur
foreach($dnszone in $dnszones){ ## pour chaque zone DNS...
	##Write-Host "Zone currently parsed:" $dnszone.ZoneName ## ... on rappelle la zone que le script est en train de parcourir ...
	$dnsrecords = Get-DnsServerResourceRecord -ComputerName serv-PA-ad-001 -ZoneName $dnszone.ZoneName | Where-Object {$_.HostName -like "$lfseq"} ## ... puis on effectue la recherche des enregistrements ayant une correspondance avec ce qui a été demandé au lancement
	if($dnsrecords.length -gt 0){ ## si il y a au moins un enregistrement de trouvé, on parse 
		foreach($dnsrecord in $dnsrecords){ ## pour chaque enregistrement dans la liste...
			##Write-Host "Record: "$dnsrecord.Hostname
			switch($dnsrecord.RecordType){ ## en fonction du type d'enregistrement, l'accès à la valeur (IP/nom) n'est pas le même
				"A" {$recorddata = $dnsrecord.RecordData.IPv4Address.IpAddressToString}
				"CNAME" {$recorddata = $dnsrecord.RecordData.HostNameAlias}
			}
			if($dnsrecord.HostName.SubString($dnsrecord.HostName.Length-$dnszone.ZoneName.Length,$dnszone.ZoneName.Length) -ne $dnszone.ZoneName) {
				$row = $dnsrecord.Hostname+","+$dnszone.ZoneName+","+$dnsrecord.RecordType+","+$recorddata ## création de la ligne qui sera ajoutée dans le fichier CSV
				Add-Content -Value $row -Path $path 
			} ## ajout au fichier CSV
		}
		##Write-Host "DNS records found:"$dnsrecords.length ## affichage console du nombre d'enregistrements trouvés
	}
	else { Write-Host "No matching records found." } ## sinon, on affiche simplement qu'il y a aucune correspondance
	##Write-Host "`r" ## caractère d'échappement pour saut de ligne et lisibilité
}
##Write-Host "Parsing over, cleaned duplicates, hence the difference between the number of lines in the CSV file and the number displayed in console. Please find the output CSV file named $path in $pwd."
##Write-Host "Bye."
##explorer $pwd ## on ouvre le répertoire courant dans lequel le fichier a été stocké
}