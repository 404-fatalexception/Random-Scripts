<#
.SYNOPSIS
Removes printer

.DESCRIPTION
Removes Windows 10 printer object

.PARAMETER PrintServer
Specifies Name of Print Server

.PARAMETER PrinterName
Specifies specific Printer Name

.INPUTS
None

.OUTPUTS
None

.EXAMPLE
.\Remove-Printer.ps1 -PrintServer "PrintServer" -PrinterName "PrinterName"
#>
[cmdletbinding()]
Param(
    [Parameter(Mandatory = $true)]
    [String]$PrintServer,

    [Parameter(Mandatory = $true)]
    [String]$PrinterName
)

function Remove-NetworkPrinter([String]$Server, [String]$Name) {
    <#
    .SYNOPSIS
    Removes printer

    .DESCRIPTION
    Removes Windows 10 printer object
    
    .PARAMETER Server
    Specifies Print Server

    .PARAMETER Name
    Specifies Printer Name

    .INPUTS
    None

    .OUTPUTS
    None

    .EXAMPLE
    Remove-NetworkPrinter -Server $PrintServer -Name $PrinterName
    #>
    $PrinterString = "\\" + "$Server" + "\" + "$Name"
    # Add Printer
    Remove-Printer -Name "$PrinterString"

}

Remove-NetworkPrinter $PrintServer $PrinterName
