<# 
Purpose: To check file size of a file
Syntax: OpConFileSizeCheck.ps1 -fileToCheck "C:\Clients\test\filezilla.txt" -size 100kb
Exit Code 30 = Unable to access the file
Exit Code 8754 = File is not greater than size entered
Tested om 11/20/19
Updated and Tested on 11/02/21
Note: If you want it to be greater than or equal change the -gt in line 34 to -ge

Written By David Cornelius
#>
param
(
[parameter(mandatory=$true)]
[string]$fileToCheck,
[parameter(mandatory=$true)]
[string]$size
)

$ErrorActionPreference = "Stop"

#Testing to confirm access to File Path location
If (Test-Path $fileToCheck)
{
    Write-Output [$(Get-Date)]:"Able to access $fileToCheck "
}
Else 
{
    $rc = 30 
    Write-Output [$(Get-Date)]:"Unable to access $fileToCheck "
    [Environment]::Exit($rc)
}

#Checking File Size
If ((Get-Item $fileToCheck).length -gt $size)
{
    Write-Output [$(Get-Date)]:"$fileToCheck IS OK FOR PROCESSING!"
}
Else
{
    $rc = 8754
    Write-Output [$(Get-Date)]:"$fileToCheck IS NOT GREATER THAN $size"
    [Environment]::Exit($rc)
}
