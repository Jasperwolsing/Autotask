---
external help file: Autotask-help.xml
Module Name: Autotask
online version:
schema: 2.0.0
---

# Get-AtwsDeletedTaskActivityLog

## SYNOPSIS
This function get one or more DeletedTaskActivityLog through the Autotask Web Services API.

## SYNTAX

### Filter (Default)
```
Get-AtwsDeletedTaskActivityLog -Filter <String[]> [-GetReferenceEntityById <String>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### By_parameters
```
Get-AtwsDeletedTaskActivityLog [-GetReferenceEntityById <String>] [-ActivityDateTime <Nullable`1[]>]
 [-CreatedByResourceID <Nullable`1[]>] [-DeletedByResourceID <Nullable`1[]>] [-DeletedDateTime <Nullable`1[]>]
 [-EndDateTime <Nullable`1[]>] [-HoursWorked <Nullable`1[]>] [-id <Nullable`1[]>]
 [-NoteOrAttachmentTitle <String[]>] [-StartDateTime <Nullable`1[]>] [-TaskID <Nullable`1[]>]
 [-TaskNumber <String[]>] [-TypeID <String[]>] [-NotEquals <String[]>] [-IsNull <String[]>]
 [-IsNotNull <String[]>] [-GreaterThan <String[]>] [-GreaterThanOrEquals <String[]>] [-LessThan <String[]>]
 [-LessThanOrEquals <String[]>] [-Like <String[]>] [-NotLike <String[]>] [-BeginsWith <String[]>]
 [-EndsWith <String[]>] [-Contains <String[]>] [-IsThisDay <String[]>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### Get_all
```
Get-AtwsDeletedTaskActivityLog [-All] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This function creates a query based on any parameters you give and returns any resulting objects from the Autotask Web Services Api.
By default the function returns any objects with properties that are Equal (-eq) to the value of the parameter.
To give you more flexibility you can modify the operator by using -NotEquals \[ParameterName\[\]\], -LessThan \[ParameterName\[\]\] and so on.

Possible operators for all parameters are:
 -NotEquals
 -GreaterThan
 -GreaterThanOrEqual
 -LessThan
 -LessThanOrEquals 

Additional operators for \[string\] parameters are:
 -Like (supports * or % as wildcards)
 -NotLike
 -BeginsWith
 -EndsWith
 -Contains

Properties with picklists are:
TypeID

Entities that have fields that refer to the base entity of this CmdLet:

## EXAMPLES

### EXAMPLE 1
```
Get-AtwsDeletedTaskActivityLog -Id 0
Returns the object with Id 0, if any.
```

### EXAMPLE 2
```
Get-AtwsDeletedTaskActivityLog -DeletedTaskActivityLogName SomeName
Returns the object with DeletedTaskActivityLogName 'SomeName', if any.
```

### EXAMPLE 3
```
Get-AtwsDeletedTaskActivityLog -DeletedTaskActivityLogName 'Some Name'
Returns the object with DeletedTaskActivityLogName 'Some Name', if any.
```

### EXAMPLE 4
```
Get-AtwsDeletedTaskActivityLog -DeletedTaskActivityLogName 'Some Name' -NotEquals DeletedTaskActivityLogName
Returns any objects with a DeletedTaskActivityLogName that is NOT equal to 'Some Name', if any.
```

### EXAMPLE 5
```
Get-AtwsDeletedTaskActivityLog -DeletedTaskActivityLogName SomeName* -Like DeletedTaskActivityLogName
Returns any object with a DeletedTaskActivityLogName that matches the simple pattern 'SomeName*'. Supported wildcards are * and %.
```

### EXAMPLE 6
```
Get-AtwsDeletedTaskActivityLog -DeletedTaskActivityLogName SomeName* -NotLike DeletedTaskActivityLogName
Returns any object with a DeletedTaskActivityLogName that DOES NOT match the simple pattern 'SomeName*'. Supported wildcards are * and %.
```

### EXAMPLE 7
```
Returns any DeletedTaskActivityLogs with property TypeID equal to the <PickList Label>. '-PickList' is any parameter on .
```

### EXAMPLE 8
```
-NotEquals TypeID 
Returns any DeletedTaskActivityLogs with property TypeID NOT equal to the <PickList Label>.
```

### EXAMPLE 9
```
, <PickList Label2>
Returns any DeletedTaskActivityLogs with property TypeID equal to EITHER <PickList Label1> OR <PickList Label2>.
```

### EXAMPLE 10
```
, <PickList Label2> -NotEquals TypeID
Returns any DeletedTaskActivityLogs with property TypeID NOT equal to NEITHER <PickList Label1> NOR <PickList Label2>.
```

### EXAMPLE 11
```
, <PickList Label2> -Like DeletedTaskActivityLogName -NotEquals TypeID -GreaterThan Id
An example of a more complex query. This command returns any DeletedTaskActivityLogs with Id GREATER THAN 1234, a DeletedTaskActivityLogName that matches the simple pattern SomeName* AND that has a TypeID that is NOT equal to NEITHER <PickList Label1> NOR <PickList Label2>.
```

## PARAMETERS

### -Filter
A filter that limits the number of objects that is returned from the API

```yaml
Type: String[]
Parameter Sets: Filter
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GetReferenceEntityById
Follow this external ID and return any external objects

```yaml
Type: String
Parameter Sets: Filter, By_parameters
Aliases: GetRef

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -All
Return all objects in one query

```yaml
Type: SwitchParameter
Parameter Sets: Get_all
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ActivityDateTime
Activity Date/Time

```yaml
Type: Nullable`1[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CreatedByResourceID
Created By Resource ID

```yaml
Type: Nullable`1[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DeletedByResourceID
Deleted By Resource ID

```yaml
Type: Nullable`1[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DeletedDateTime
Deleted Date/Time

```yaml
Type: Nullable`1[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EndDateTime
End Date/Time

```yaml
Type: Nullable`1[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HoursWorked
Hours Worked

```yaml
Type: Nullable`1[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -id
Deleted Task Activity Log ID

```yaml
Type: Nullable`1[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoteOrAttachmentTitle
Note Or Attachment Title

```yaml
Type: String[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StartDateTime
Start Date/Time

```yaml
Type: Nullable`1[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TaskID
Task ID

```yaml
Type: Nullable`1[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TaskNumber
Task Number

```yaml
Type: String[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TypeID
Type ID

```yaml
Type: String[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NotEquals
{{ Fill NotEquals Description }}

```yaml
Type: String[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IsNull
{{ Fill IsNull Description }}

```yaml
Type: String[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IsNotNull
{{ Fill IsNotNull Description }}

```yaml
Type: String[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GreaterThan
{{ Fill GreaterThan Description }}

```yaml
Type: String[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GreaterThanOrEquals
{{ Fill GreaterThanOrEquals Description }}

```yaml
Type: String[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LessThan
{{ Fill LessThan Description }}

```yaml
Type: String[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LessThanOrEquals
{{ Fill LessThanOrEquals Description }}

```yaml
Type: String[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Like
{{ Fill Like Description }}

```yaml
Type: String[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NotLike
{{ Fill NotLike Description }}

```yaml
Type: String[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BeginsWith
{{ Fill BeginsWith Description }}

```yaml
Type: String[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EndsWith
{{ Fill EndsWith Description }}

```yaml
Type: String[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Contains
{{ Fill Contains Description }}

```yaml
Type: String[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IsThisDay
{{ Fill IsThisDay Description }}

```yaml
Type: String[]
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Nothing. This function only takes parameters.
## OUTPUTS

### [Autotask.DeletedTaskActivityLog[]]. This function outputs the Autotask.DeletedTaskActivityLog that was returned by the API.
## NOTES
Related commands:

## RELATED LINKS
