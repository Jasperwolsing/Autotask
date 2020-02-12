﻿#Requires -Version 4.0
<#
    .COPYRIGHT
    Copyright (c) ECIT Solutions AS. All rights reserved. Licensed under the MIT license.
    See https://github.com/ecitsolutions/Autotask/blob/master/LICENSE.md  for license information.
#>

Function Get-AtwsWsdlVersion {
    <#
        .SYNOPSIS
            This function gets the current API version from the Autotask servers.
        .DESCRIPTION
            The function calls GetWsdlVersion() and returns the result.
        .INPUTS
            Nothing.
        .OUTPUTS
            ATWSResponse
        .EXAMPLE
            Get-AtwsWsdlVersion
            gets the current API version from the Autotask servers.
        
        .NOTES
            NAME: Get-AtwsWsdlVersion
      
  #>
	
    [cmdletbinding()]
    Param
    (
    )
  
    begin {    
        # Enable modern -Debug behavior
        if ($PSCmdlet.MyInvocation.BoundParameters['Debug'].IsPresent) { $DebugPreference = 'Continue' }
   
        Write-Debug ('{0}: Begin of function' -F $MyInvocation.MyCommand.Name)
    
        if (-not($Script:Atws.integrationsValue)) {
            Throw [ApplicationException] 'Not connected to Autotask WebAPI. Re-import module with valid credentials.'
        }    
    }

    process {
        try { 
            Write-Verbose ('{0}: Calling GetWsdlVersion()' -F $MyInvocation.MyCommand.Name)

            $result = $Script:Atws.GetWsdlVersion($Script:Atws.IntegrationsValue)
        }
        catch {
            throw [System.Net.WebException]::New('{0}: FAILED on GetWsdlVersion($Script:Atws.IntegrationsValue). No data returned.' -F $MyInvocation.MyCommand.Name)           
            Return
        }

        # Handle any errors
        if ($result.Errors.Count -gt 0) {
            foreach ($AtwsError in $result.Errors) {
                Write-Error $AtwsError.Message
            }
            Return
        }
    }

    end {
        Return $result
    }
}