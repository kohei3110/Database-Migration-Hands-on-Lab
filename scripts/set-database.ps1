# Copy and Extract
Invoke-WebRequest 'https://raw.githubusercontent.com/hiroyay-ms/Server-Migration-Hands-on-Lab/master/Hands-on%20lab/src/ContosoInsurance.zip' -OutFile 'C:\ContosoInsurance.zip'
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory('C:\ContosoInsurance.zip','C:\ContosoInsurance')

Copy-Item 'C:\ContosoInsurance\*' -Destination 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA' -Recurse

# Attach ContosoInsurance Database
function Enable-SqlDatabase {
    #Add snap-in
    Add-PSSnapin SqlServerCmdletSnapin* -ErrorAction SilentlyContinue

    $ServerName = 'SQL-SVR'
    $DatabaseName = 'ContosoInsurance'
    $FilePath = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\'
    $MdfFileName = $FilePath + 'ContosoInsurance.mdf'
    $LdfFileName = $FilePath + 'ContosoInsurance_log.ldf'

    $AttachCmd = "CREATE DATABASE [" + $DatabaseName + "] ON (FILENAME = '" + $MdfFileName + "'), (FILENAME = '" + $LdfFileName + "') for ATTACH"

    Invoke-Sqlcmd -ServerInstance $ServerName -Database "master" -Username "SqlUser" -Password "Password.1!!" -Query $AttachCmd
}

Enable-SqlDatabase