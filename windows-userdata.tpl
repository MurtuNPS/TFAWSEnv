<powershell>
$disks_string='${disks}'
$disks = $disks_string.Split(",")
$hostname = '${hostname}'

   $disks.ForEach({
        $letter = $_.split(":")[0]
        $letter = [string]::join("",($letter.Split("`n")))
       $size = $_.split(":")[1]
        $size = -join $size, "gb"
        $size = [string]::join("",($size.Split("`n")))
       
        Get-Disk | Where partitionstyle -eq 'raw' | Where size -eq $size | Select-Object -First 1 | Initialize-Disk -PartitionStyle MBR -PassThru | New-Partition -DriveLetter $letter -UseMaximumSize | Format-Volume -FileSystem NTFS -Confirm:$false
    })


</powershell>