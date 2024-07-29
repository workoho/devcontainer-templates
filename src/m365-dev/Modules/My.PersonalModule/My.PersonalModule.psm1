<#
.SYNOPSIS
    My personal module.
.DESCRIPTION
    This is a personal module that I use to store my personal functions.

    This module is not intended to be shared with others. It is for my personal use only.
#>

Get-ChildItem -Path "$PSScriptRoot/Functions", "$PSScriptRoot/Private", "$PSScriptRoot/Public" -Filter '*.ps1' -ErrorAction SilentlyContinue | Where-Object { $_.Name -notlike '*.Tests.ps1' } | ForEach-Object {
    try {
        $ImportScriptFile = $_

        if ($_.BaseName -notmatch '^[A-Za-z]+-My_') {
            Throw "File name must use naming convention 'Verb-My_Noun.ps1' (e.g. 'Get-My_User.ps1'). Function not imported."
            return
        }

        . $ImportScriptFile.FullName

        if (
            @(
                (
                    Get-ChildItem -Path Function: | Where-Object Source -eq $MyInvocation.MyCommand.ScriptBlock.Module
                ).Name
            ) -inotcontains $_.BaseName
        ) {
            Throw "Does not contain the expected function named '$($_.BaseName)'"
        }

        if ($_.Directory.Name -eq 'Public') {
            [void] $Script:ModuleMemberExport.Function.Add($_.BaseName)
        }
    }
    catch {
        Write-Error "[$($MyInvocation.MyCommand)]: - Failed to import script '$(Join-Path $ImportScriptFile.Directory.Name $ImportScriptFile.Name)': $_"
    }
    finally {
        Remove-Variable ImportScriptFile -ErrorAction Ignore
    }
}
