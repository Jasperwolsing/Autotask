---
external help file: Autotask-help.xml
Module Name: Autotask
online version:
schema: 2.0.0
---

# Get-AtwsInstalledProductTypeUdfAssociation

## SYNOPSIS
This function get one or more InstalledProductTypeUdfAssociation through the Autotask Web Services API.

## SYNTAX

### Filter (Default)
```
Get-AtwsInstalledProductTypeUdfAssociation -Filter <String[]> [-GetReferenceEntityById <String>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

### By_parameters
```
Get-AtwsInstalledProductTypeUdfAssociation [-GetReferenceEntityById <String>] [-id <Nullable`1[]>]
 [-InstalledProductTypeId <Nullable`1[]>] [-Required <Nullable`1[]>] [-SortOrder <Nullable`1[]>]
 [-UserDefinedFieldDefinitionId <Nullable`1[]>] [-NotEquals <String[]>] [-IsNull <String[]>]
 [-IsNotNull <String[]>] [-GreaterThan <String[]>] [-GreaterThanOrEquals <String[]>] [-LessThan <String[]>]
 [-LessThanOrEquals <String[]>] [-Like <String[]>] [-NotLike <String[]>] [-BeginsWith <String[]>]
 [-EndsWith <String[]>] [-Contains <String[]>] [-IsThisDay <String[]>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### Get_all
```
Get-AtwsInstalledProductTypeUdfAssociation [-All] [-WhatIf] [-Confirm] [<CommonParameters>]
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


Entities that have fields that refer to the base entity of this CmdLet:

## EXAMPLES

### EXAMPLE 1
```
Get-AtwsInstalledProductTypeUdfAssociation -Id 0
Returns the object with Id 0, if any.
```

### EXAMPLE 2
```
Get-AtwsInstalledProductTypeUdfAssociation -InstalledProductTypeUdfAssociationName SomeName
Returns the object with InstalledProductTypeUdfAssociationName 'SomeName', if any.
```

### EXAMPLE 3
```
Get-AtwsInstalledProductTypeUdfAssociation -InstalledProductTypeUdfAssociationName 'Some Name'
Returns the object with InstalledProductTypeUdfAssociationName 'Some Name', if any.
```

### EXAMPLE 4
```
Get-AtwsInstalledProductTypeUdfAssociation -InstalledProductTypeUdfAssociationName 'Some Name' -NotEquals InstalledProductTypeUdfAssociationName
Returns any objects with a InstalledProductTypeUdfAssociationName that is NOT equal to 'Some Name', if any.
```

### EXAMPLE 5
```
Get-AtwsInstalledProductTypeUdfAssociation -InstalledProductTypeUdfAssociationName SomeName* -Like InstalledProductTypeUdfAssociationName
Returns any object with a InstalledProductTypeUdfAssociationName that matches the simple pattern 'SomeName*'. Supported wildcards are * and %.
```

### EXAMPLE 6
```
Get-AtwsInstalledProductTypeUdfAssociation -InstalledProductTypeUdfAssociationName SomeName* -NotLike InstalledProductTypeUdfAssociationName
Returns any object with a InstalledProductTypeUdfAssociationName that DOES NOT match the simple pattern 'SomeName*'. Supported wildcards are * and %.
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

### -id
Id

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

### -InstalledProductTypeId
Installed Product Type Id

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

### -Required
Required

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

### -SortOrder
Sort Order

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

### -UserDefinedFieldDefinitionId
User Defined Field Definition Id

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

### [Autotask.InstalledProductTypeUdfAssociation[]]. This function outputs the Autotask.InstalledProductTypeUdfAssociation that was returned by the API.
## NOTES
Related commands:
New-AtwsInstalledProductTypeUdfAssociation
 Remove-AtwsInstalledProductTypeUdfAssociation
 Set-AtwsInstalledProductTypeUdfAssociation

## RELATED LINKS
