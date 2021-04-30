#Requires -Version 5.0
<#
    .COPYRIGHT
    Copyright (c) ECIT Solutions AS. All rights reserved. Licensed under the MIT license.
    See https://github.com/ecitsolutions/Autotask/blob/master/LICENSE.md for license information.
#>
Function New-AtwsTimeEntry
{


<#
.SYNOPSIS
This function creates a new TimeEntry through the Autotask Web Services API. All required properties are marked as required parameters to assist you on the command line.
.DESCRIPTION
The function supports all properties of an [Autotask.TimeEntry] that can be updated through the Web Services API. The function uses PowerShell parameter validation  and supports IntelliSense for selecting picklist values. Any required paramterer is marked as Mandatory in the PowerShell function to assist you on the command line.

If you need very complicated queries you can write a filter directly and pass it using the -Filter parameter. To get the TimeEntry with Id number 0 you could write 'New-AtwsTimeEntry -Id 0' or you could write 'New-AtwsTimeEntry -Filter {Id -eq 0}.

'New-AtwsTimeEntry -Id 0,4' could be written as 'New-AtwsTimeEntry -Filter {id -eq 0 -or id -eq 4}'. For simple queries you can see that using parameters is much easier than the -Filter option. But the -Filter option supports an arbitrary sequence of most operators (-eq, -ne, -gt, -ge, -lt, -le, -and, -or, -beginswith, -endswith, -contains, -like, -notlike, -soundslike, -isnotnull, -isnull, -isthisday). As you can group them using parenthesis '()' you can write arbitrarily complex queries with -Filter. 

To create a new TimeEntry you need the following required fields:
 -ResourceID

Entities that have fields that refer to the base entity of this CmdLet:


.INPUTS
Nothing. This function only takes parameters.
.OUTPUTS
[Autotask.TimeEntry]. This function outputs the Autotask.TimeEntry that was created by the API.
.EXAMPLE
$result = New-AtwsTimeEntry -ResourceID [Value]
Creates a new [Autotask.TimeEntry] through the Web Services API and returns the new object.
 .EXAMPLE
$result = Get-AtwsTimeEntry -Id 124 | New-AtwsTimeEntry 
Copies [Autotask.TimeEntry] by Id 124 to a new object through the Web Services API and returns the new object.
 .EXAMPLE
Get-AtwsTimeEntry -Id 124 | New-AtwsTimeEntry | Set-AtwsTimeEntry -ParameterName <Parameter Value>
Copies [Autotask.TimeEntry] by Id 124 to a new object through the Web Services API, passes the new object to the Set-AtwsTimeEntry to modify the object.
 .EXAMPLE
$result = Get-AtwsTimeEntry -Id 124 | New-AtwsTimeEntry | Set-AtwsTimeEntry -ParameterName <Parameter Value> -Passthru
Copies [Autotask.TimeEntry] by Id 124 to a new object through the Web Services API, passes the new object to the Set-AtwsTimeEntry to modify the object and returns the new object.

.LINK
Remove-AtwsTimeEntry
 .LINK
Get-AtwsTimeEntry
 .LINK
Set-AtwsTimeEntry

#>

  [CmdLetBinding(SupportsShouldProcess = $true, DefaultParameterSetName='By_parameters', ConfirmImpact='Low')]
  Param
  (
# An array of objects to create
    [Parameter(
      ParametersetName = 'Input_Object',
      ValueFromPipeline = $true
    )]
    [ValidateNotNullOrEmpty()]
    [Autotask.TimeEntry[]]
    $InputObject,

# Allocation Code ID
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [Int]
    $AllocationCodeID,

# Billing Approval Date Time
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [datetime]
    $BillingApprovalDateTime,

# Billing Approval Level Most Recent
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [Int]
    $BillingApprovalLevelMostRecent,

# Billing Approval Resource ID
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [Int]
    $BillingApprovalResourceID,

# Contract ID
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [Int]
    $ContractID,

# Contract Service Bundle ID
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [long]
    $ContractServiceBundleID,

# Contract Service ID
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [long]
    $ContractServiceID,

# Create Date Time
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [datetime]
    $CreateDateTime,

# Created User ID
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [Int]
    $CreatorUserID,

# Date
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [datetime]
    $DateWorked,

# End Date Time
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [datetime]
    $EndDateTime,

# Hours To Bill
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [double]
    $HoursToBill,

# Hours Worked
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [double]
    $HoursWorked,

# Impersonator Creator Resource ID
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [Int]
    $ImpersonatorCreatorResourceID,

# Impersonator Updater Resource ID
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [Int]
    $ImpersonatorUpdaterResourceID,

# Internal Allocation Code ID
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [Int]
    $InternalAllocationCodeID,

# Internal Notes
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ValidateLength(0,32000)]
    [string]
    $InternalNotes,

# Last Modified Datetime
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [datetime]
    $LastModifiedDateTime,

# Last Modified By User ID
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [Int]
    $LastModifiedUserID,

# Non-Billable
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [boolean]
    $NonBillable,

# Offset Hours
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [double]
    $OffsetHours,

# Resource ID
    [Parameter(
      Mandatory = $true,
      ParametersetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [Int]
    $ResourceID,

# Role ID
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [Int]
    $RoleID,

# Show On Invoice
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [boolean]
    $ShowOnInvoice,

# Start Date Time
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [datetime]
    $StartDateTime,

# Summary Notes
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ValidateLength(0,32000)]
    [string]
    $SummaryNotes,

# Task ID
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [Int]
    $TaskID,

# Ticket ID
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [Int]
    $TicketID,

# TaskTypeLink
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ArgumentCompleter({
      param($Cmd, $Param, $Word, $Ast, $FakeBound)
      Get-AtwsPicklistValue -Entity TimeEntry -FieldName Type -Label -Quoted
    })]
    [ValidateScript({
      $set = (Get-AtwsPicklistValue -Entity TimeEntry -FieldName Type -Label) + (Get-AtwsPicklistValue -Entity TimeEntry -FieldName Type -Value)
      if ($_ -in $set) { return $true}
      else {
        Write-Warning ('{0} is not one of {1}' -f $_, ($set -join ', '))
        Return $false
      }
    })]
    [string]
    $Type
  )

    begin {
        $entityName = 'TimeEntry'

        # Enable modern -Debug behavior
        if ($PSCmdlet.MyInvocation.BoundParameters['Debug'].IsPresent) {
            $DebugPreference = 'Continue'
        }
        else {
            # Respect configured preference
            $DebugPreference = $Script:Atws.Configuration.DebugPref
        }

        Write-Debug ('{0}: Begin of function' -F $MyInvocation.MyCommand.Name)

        if (!($PSCmdlet.MyInvocation.BoundParameters['Verbose'].IsPresent)) {
            # No local override of central preference. Load central preference
            $VerbosePreference = $Script:Atws.Configuration.VerbosePref
        }

        $result = [collections.generic.list[psobject]]::new()
    }

    process {

        if ($InputObject) {
            Write-Verbose -Message ('{0}: Copy Object mode: Setting ID property to zero' -F $MyInvocation.MyCommand.Name)

            #Measure-Object should work here, but returns 0 as Count/Sum. 
            #Count throws error if we cast a null value to its method, but here we know that we dont have a null value.
            $sum = ($InputObject).Count

            # If $sum has value we must reset object IDs or we will modify existing objects, not create new ones
            if ($sum -gt 0) {
                foreach ($object in $InputObject) {
                    $object.Id = $null
                    $inputObject.add($object)
                }
            }
        }
        else {
            Write-Debug -Message ('{0}: Creating empty [Autotask.{1}]' -F $MyInvocation.MyCommand.Name, $entityName)
            $inputObject.add((New-Object -TypeName Autotask.$entityName))
        }

        # Prepare shouldProcess comments
        $caption = $MyInvocation.MyCommand.Name
        $verboseDescription = '{0}: About to create {1} {2}(s). This action cannot be undone.' -F $caption, $inputObject.Count, $entityName
        $verboseWarning = '{0}: About to create {1} {2}(s). This action may not be undoable. Do you want to continue?' -F $caption, $inputObject.Count, $entityName

        # Lets don't and say we did!
        if ($PSCmdlet.ShouldProcess($verboseDescription, $verboseWarning, $caption)) {

            # Process parameters and update objects with their values
            $inputObject = $inputObject | Update-AtwsObjectsWithParameters -BoundParameters $PSBoundParameters -EntityName $EntityName

            try {
                # Force list even if result is only 1 object to be compatible with addrange()
                [collections.generic.list[psobject]]$response = Set-AtwsData -Entity $inputObject -Create
            }
            catch {
                # Write a debug message with detailed information to developers
                $reason = ("{0}: {1}" -f $_.CategoryInfo.Category, $_.CategoryInfo.Reason)
                $message = "{2}: {0}`r`n`r`nLine:{1}`r`n`r`nScript stacktrace:`r`n{3}" -f $_.Exception.Message, $_.InvocationInfo.Line, $reason, $_.ScriptStackTrace
                Write-Debug $message

                # Pass on the error
                $PSCmdlet.ThrowTerminatingError($_)
                return
            }
            # If using pipeline this block (process) will run once pr item in the pipeline. make sure to return them all
            if ($response.Count -gt 0) {
                $result.AddRange($response)
            }
        }
    }

    end {
        Write-Debug -Message ('{0}: End of function, returning {1} {2}(s)' -F $MyInvocation.MyCommand.Name, $result.count, $entityName)
        Return [array]$result
    }

}
