#Requires -Version 5.0
<#
    .COPYRIGHT
    Copyright (c) ECIT Solutions AS. All rights reserved. Licensed under the MIT license.
    See https://github.com/ecitsolutions/Autotask/blob/master/LICENSE.md for license information.
#>
Function Get-AtwsAttachmentInfo
{


<#
.SYNOPSIS
This function get one or more AttachmentInfo through the Autotask Web Services API.
.DESCRIPTION
This function creates a query based on any parameters you give and returns any resulting objects from the Autotask Web Services Api. By default the function returns any objects with properties that are Equal (-eq) to the value of the parameter. To give you more flexibility you can modify the operator by using -NotEquals [ParameterName[]], -LessThan [ParameterName[]] and so on.

Possible operators for all parameters are:
 -NotEquals
 -GreaterThan
 -GreaterThanOrEqual
 -LessThan
 -LessThanOrEquals 

Additional operators for [string] parameters are:
 -Like (supports * or % as wildcards)
 -NotLike
 -BeginsWith
 -EndsWith
 -Contains

Properties with picklists are:
ParentType
Type
Publish
CreatorType

Entities that have fields that refer to the base entity of this CmdLet:


.INPUTS
Nothing. This function only takes parameters.
.OUTPUTS
[Autotask.AttachmentInfo[]]. This function outputs the Autotask.AttachmentInfo that was returned by the API.
.EXAMPLE
Get-AtwsAttachmentInfo -Id 0
Returns the object with Id 0, if any.
 .EXAMPLE
Get-AtwsAttachmentInfo -AttachmentInfoName SomeName
Returns the object with AttachmentInfoName 'SomeName', if any.
 .EXAMPLE
Get-AtwsAttachmentInfo -AttachmentInfoName 'Some Name'
Returns the object with AttachmentInfoName 'Some Name', if any.
 .EXAMPLE
Get-AtwsAttachmentInfo -AttachmentInfoName 'Some Name' -NotEquals AttachmentInfoName
Returns any objects with a AttachmentInfoName that is NOT equal to 'Some Name', if any.
 .EXAMPLE
Get-AtwsAttachmentInfo -AttachmentInfoName SomeName* -Like AttachmentInfoName
Returns any object with a AttachmentInfoName that matches the simple pattern 'SomeName*'. Supported wildcards are * and %.
 .EXAMPLE
Get-AtwsAttachmentInfo -AttachmentInfoName SomeName* -NotLike AttachmentInfoName
Returns any object with a AttachmentInfoName that DOES NOT match the simple pattern 'SomeName*'. Supported wildcards are * and %.
 .EXAMPLE
Get-AtwsAttachmentInfo -ParentType <PickList Label>
Returns any AttachmentInfos with property ParentType equal to the <PickList Label>. '-PickList' is any parameter on .
 .EXAMPLE
Get-AtwsAttachmentInfo -ParentType <PickList Label> -NotEquals ParentType 
Returns any AttachmentInfos with property ParentType NOT equal to the <PickList Label>.
 .EXAMPLE
Get-AtwsAttachmentInfo -ParentType <PickList Label1>, <PickList Label2>
Returns any AttachmentInfos with property ParentType equal to EITHER <PickList Label1> OR <PickList Label2>.
 .EXAMPLE
Get-AtwsAttachmentInfo -ParentType <PickList Label1>, <PickList Label2> -NotEquals ParentType
Returns any AttachmentInfos with property ParentType NOT equal to NEITHER <PickList Label1> NOR <PickList Label2>.
 .EXAMPLE
Get-AtwsAttachmentInfo -Id 1234 -AttachmentInfoName SomeName* -ParentType <PickList Label1>, <PickList Label2> -Like AttachmentInfoName -NotEquals ParentType -GreaterThan Id
An example of a more complex query. This command returns any AttachmentInfos with Id GREATER THAN 1234, a AttachmentInfoName that matches the simple pattern SomeName* AND that has a ParentType that is NOT equal to NEITHER <PickList Label1> NOR <PickList Label2>.


#>

  [CmdLetBinding(SupportsShouldProcess = $true, DefaultParameterSetName='Filter', ConfirmImpact='None')]
  Param
  (
# A filter that limits the number of objects that is returned from the API
    [Parameter(
      Mandatory = $true,
      ValueFromRemainingArguments = $true,
      ParametersetName = 'Filter'
    )]
    [ValidateNotNullOrEmpty()]
    [string[]]
    $Filter,

# Follow this external ID and return any external objects
    [Parameter(
      ParametersetName = 'Filter'
    )]
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [Alias('GetRef')]
    [ValidateNotNullOrEmpty()]
    [ValidateSet('AttachedByContactID', 'AttachedByResourceID', 'ImpersonatorCreatorResourceID', 'OpportunityID')]
    [string]
    $GetReferenceEntityById,

# Return all objects in one query
    [Parameter(
      ParametersetName = 'Get_all'
    )]
    [switch]
    $All,

# Attach Date
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [Nullable[datetime][]]
    $AttachDate,

# Attached By Contact
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [Nullable[long][]]
    $AttachedByContactID,

# Attached By Resource
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [Nullable[long][]]
    $AttachedByResourceID,

# Content Type
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ValidateLength(0,100)]
    [string[]]
    $ContentType,

# File Name
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [ValidateLength(0,255)]
    [string[]]
    $FullPath,

# Attachment ID
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [Nullable[long][]]
    $id,

# Impersonator Creator Resource ID
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [Nullable[Int][]]
    $ImpersonatorCreatorResourceID,

# Opportunity ID
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [Nullable[long][]]
    $OpportunityID,

# Parent ID
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [Nullable[long][]]
    $ParentID,

# Parent Type
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [ArgumentCompleter({
      param($Cmd, $Param, $Word, $Ast, $FakeBound)
      Get-AtwsPicklistValue -Entity AttachmentInfo -FieldName ParentType -Label
    })]
    [ValidateScript({
      $set = Get-AtwsPicklistValue -Entity AttachmentInfo -FieldName ParentType -Label
      if ($_ -in $set) { return $true}
      else {
        Write-Warning ('{0} is not one of {1}' -f $_, ($set -join ', '))
        Return $false
      }
    })]
    [string[]]
    $ParentType,

# Publish
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [ArgumentCompleter({
      param($Cmd, $Param, $Word, $Ast, $FakeBound)
      Get-AtwsPicklistValue -Entity AttachmentInfo -FieldName Publish -Label
    })]
    [ValidateScript({
      $set = Get-AtwsPicklistValue -Entity AttachmentInfo -FieldName Publish -Label
      if ($_ -in $set) { return $true}
      else {
        Write-Warning ('{0} is not one of {1}' -f $_, ($set -join ', '))
        Return $false
      }
    })]
    [string[]]
    $Publish,

# Title
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [ValidateLength(0,255)]
    [string[]]
    $Title,

# Type
    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ValidateNotNullOrEmpty()]
    [ArgumentCompleter({
      param($Cmd, $Param, $Word, $Ast, $FakeBound)
      Get-AtwsPicklistValue -Entity AttachmentInfo -FieldName Type -Label
    })]
    [ValidateScript({
      $set = Get-AtwsPicklistValue -Entity AttachmentInfo -FieldName Type -Label
      if ($_ -in $set) { return $true}
      else {
        Write-Warning ('{0} is not one of {1}' -f $_, ($set -join ', '))
        Return $false
      }
    })]
    [string[]]
    $Type,

    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ValidateSet('CreatorType', 'Publish', 'id', 'AttachedByContactID', 'FileSize', 'ParentType', 'Title', 'Type', 'ImpersonatorCreatorResourceID', 'AttachedByResourceID', 'FullPath', 'ContentType', 'OpportunityID', 'ParentID', 'AttachDate')]
    [string[]]
    $NotEquals,

    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ValidateSet('CreatorType', 'Publish', 'id', 'AttachedByContactID', 'FileSize', 'ParentType', 'Title', 'Type', 'ImpersonatorCreatorResourceID', 'AttachedByResourceID', 'FullPath', 'ContentType', 'OpportunityID', 'ParentID', 'AttachDate')]
    [string[]]
    $IsNull,

    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ValidateSet('CreatorType', 'Publish', 'id', 'AttachedByContactID', 'FileSize', 'ParentType', 'Title', 'Type', 'ImpersonatorCreatorResourceID', 'AttachedByResourceID', 'FullPath', 'ContentType', 'OpportunityID', 'ParentID', 'AttachDate')]
    [string[]]
    $IsNotNull,

    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ValidateSet('id', 'ParentID', 'ParentType', 'Type', 'Title', 'FullPath', 'AttachDate', 'FileSize', 'AttachedByContactID', 'AttachedByResourceID', 'Publish', 'ContentType', 'OpportunityID', 'ImpersonatorCreatorResourceID', 'CreatorType')]
    [string[]]
    $GreaterThan,

    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ValidateSet('id', 'ParentID', 'ParentType', 'Type', 'Title', 'FullPath', 'AttachDate', 'FileSize', 'AttachedByContactID', 'AttachedByResourceID', 'Publish', 'ContentType', 'OpportunityID', 'ImpersonatorCreatorResourceID', 'CreatorType')]
    [string[]]
    $GreaterThanOrEquals,

    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ValidateSet('id', 'ParentID', 'ParentType', 'Type', 'Title', 'FullPath', 'AttachDate', 'FileSize', 'AttachedByContactID', 'AttachedByResourceID', 'Publish', 'ContentType', 'OpportunityID', 'ImpersonatorCreatorResourceID', 'CreatorType')]
    [string[]]
    $LessThan,

    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ValidateSet('id', 'ParentID', 'ParentType', 'Type', 'Title', 'FullPath', 'AttachDate', 'FileSize', 'AttachedByContactID', 'AttachedByResourceID', 'Publish', 'ContentType', 'OpportunityID', 'ImpersonatorCreatorResourceID', 'CreatorType')]
    [string[]]
    $LessThanOrEquals,

    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ValidateSet('Type', 'Title', 'FullPath', 'ContentType')]
    [string[]]
    $Like,

    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ValidateSet('Type', 'Title', 'FullPath', 'ContentType')]
    [string[]]
    $NotLike,

    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ValidateSet('Type', 'Title', 'FullPath', 'ContentType')]
    [string[]]
    $BeginsWith,

    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ValidateSet('Type', 'Title', 'FullPath', 'ContentType')]
    [string[]]
    $EndsWith,

    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ValidateSet('Type', 'Title', 'FullPath', 'ContentType')]
    [string[]]
    $Contains,

    [Parameter(
      ParametersetName = 'By_parameters'
    )]
    [ValidateSet('AttachDate')]
    [string[]]
    $IsThisDay
  )

    begin { 
        $entityName = 'AttachmentInfo'
    
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
        
        $result = [Collections.ArrayList]::new()
        $iterations = [Collections.Arraylist]::new()
    }


    process {
        # Parameterset Get_All has a single parameter: -All
        # Set the Filter manually to get every single object of this type 
        if ($PSCmdlet.ParameterSetName -eq 'Get_all') { 
            $Filter = @('id', '-ge', 0)
            [void]$iterations.Add($Filter)
        }
        # So it is not -All. If Filter does not exist it has to be By_parameters
        elseif (-not ($Filter)) {
    
            Write-Debug ('{0}: Query based on parameters, parsing' -F $MyInvocation.MyCommand.Name)
            
            # find parameter with highest count
            $index = @{}
            $max = ($PSBoundParameters.getenumerator() | foreach-object { $index[$_.count] = $_.key ; $_.count } | Sort-Object -Descending)[0]
            $param = $index[$max]
            # Extract the parameter content, sort it ascending (we assume it is an Id field)
            # and deduplicate
            $count = $PSBoundParameters[$param].count

            # Check number of values. If it is less than or equal to 200 we pass PSBoundParameters as is
            if ($count -le 200) { 
                [string[]]$Filter = ConvertTo-AtwsFilter -BoundParameters $PSBoundParameters -EntityName $entityName
                [void]$iterations.Add($Filter)
            }
            # More than 200 values. This will cause a SQL query nested too much. Break a single parameter
            # into segments and create multiple queries with max 200 values
            else {
                # Deduplicate the value list or the same ID may be included in more than 1 query
                $outerLoop = $PSBoundParameters[$param] | Sort-Object -Unique

                Write-Verbose ('{0}: Received {1} objects containing {2} unique values for parameter {3}' -f $MyInvocation.MyCommand.Name, $count, $outerLoop.Count, $param)

                # Make a writable copy of PSBoundParameters
                $BoundParameters = $PSBoundParameters
                for ($i = 0; $i -lt $outerLoop.count; $i += 200) {
                    $j = $i + 199
                    if ($j -ge $outerLoop.count) {
                        $j = $outerLoop.count - 1
                    } 

                    # make a selection
                    $BoundParameters[$param] = $outerLoop[$i .. $j]
                    
                    Write-Verbose ('{0}: Asking for {1} values {2} to {3}' -f $MyInvocation.MyCommand.Name, $param, $i, $j)
            
                    # Convert named parameters to a filter definition that can be parsed to QueryXML
                    [string[]]$Filter = ConvertTo-AtwsFilter -BoundParameters $BoundParameters -EntityName $entityName
                    [void]$iterations.Add($Filter)
                }
            }
        }
        # Not parameters, nor Get_all. There are only three parameter sets, so now we know
        # that we were passed a Filter
        else {
      
            Write-Debug ('{0}: Query based on manual filter, parsing' -F $MyInvocation.MyCommand.Name)
            
            # Parse the filter string and expand variables in _this_ scope (dot-sourcing)
            # or the variables will not be available and expansion will fail
            $Filter = . Update-AtwsFilter -Filterstring $Filter
            [void]$iterations.Add($Filter)
        } 

        # Prepare shouldProcess comments
        $caption = $MyInvocation.MyCommand.Name
        $verboseDescription = '{0}: About to query the Autotask Web API for {1}(s).' -F $caption, $entityName
        $verboseWarning = '{0}: About to query the Autotask Web API for {1}(s). Do you want to continue?' -F $caption, $entityName
    
        # Lets do it and say we didn't!
        if ($PSCmdlet.ShouldProcess($verboseDescription, $verboseWarning, $caption)) { 
            foreach ($Filter in $iterations) { 

                try { 
                    # Make the query and pass the optional parameters to Get-AtwsData
                    $response = Get-AtwsData -Entity $entityName -Filter $Filter `
                        -NoPickListLabel:$NoPickListLabel.IsPresent `
                        -GetReferenceEntityById $GetReferenceEntityById
                }
                catch {
                    write-host "ERROR: " -ForegroundColor Red -NoNewline
                    write-host $_.Exception.Message
                    write-host ("{0}: {1}" -f $_.CategoryInfo.Category,$_.CategoryInfo.Reason) -ForegroundColor Cyan
                    $_.ScriptStackTrace -split '\n' | ForEach-Object {
                        Write-host "  |  " -ForegroundColor Cyan -NoNewline
                        Write-host $_
                    }
                }
                # If multiple items use .addrange(). If a single item use .add()
                if ($response.count -gt 1) { 
                    [void]$result.AddRange($response)
                }
                else {
                    [void]$result.Add($response)
                }
                Write-Verbose ('{0}: Number of entities returned by base query: {1}' -F $MyInvocation.MyCommand.Name, $result.Count)
            }
        }
    }

    end {
        Write-Debug ('{0}: End of function' -F $MyInvocation.MyCommand.Name)
        if ($result) {
            Return $result
        }
    }


}
