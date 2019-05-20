<#
.SYNOPSIS
Adds new printer

.DESCRIPTION
Adds new Windows printer and sets as default

.PARAMETER PrintServer
Specifies Name of Print Server

.PARAMETER Name
Specifies specific Printer Name

.INPUTS
None

.OUTPUTS
None

.EXAMPLE
.\Add-Printer.ps1 -PrintServer "PrintServer" -PrinterName "PrinterName"
#>
[cmdletbinding()]
Param(
    [Parameter(Mandatory = $true)]
    [String]$PrintServer,

    [Parameter(Mandatory = $true)]
    [String]$PrinterName
)

function Add-NetworkPrinter([String]$Server, [String]$Name) {
    <#
    .SYNOPSIS
    Adds new printer
 
    .DESCRIPTION
    Adds new Windows printer and sets as default
    
    .PARAMETER Server
    Specifies Print Server

    .PARAMETER Name
    Specifies Printer Name

    .INPUTS
    None

    .OUTPUTS
    None

    .EXAMPLE
    Add-NetworkPrinter -Server $PrintServer -Name $PrinterName
    #>
    $PrinterString = "\\" + "$Server" + "\" + "$Name"
    # Add Printer
    Add-Printer -ConnectionName "$PrinterString"

    # Set as Default
    $current = (Get-WmiObject -Query " SELECT name FROM Win32_Printer WHERE Default=$true").Name
    if($current -notlike $PrinterString) {
        (New-Object -ComObject WScript.Network).SetDefaultPrinter($PrinterString)
    }
}

Add-NetworkPrinter $PrintServer $PrinterName
