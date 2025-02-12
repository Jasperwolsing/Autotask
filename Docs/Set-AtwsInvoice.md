---
external help file: Autotask-help.xml
Module Name: Autotask
online version:
schema: 2.0.0
---

# Set-AtwsInvoice

## SYNOPSIS
This function sets parameters on the Invoice specified by the -InputObject parameter or pipeline through the use of the Autotask Web Services API.
Any property of the Invoice that is not marked as READ ONLY by Autotask can be speficied with a parameter.
You can specify multiple paramters.

## SYNTAX

### InputObject (Default)
```
Set-AtwsInvoice [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Input_Object
```
Set-AtwsInvoice [-InputObject <Invoice[]>] [-PassThru] [-InvoiceNumber <String>] [-PaidDate <DateTime>]
 [-WebServiceDate <DateTime>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### By_Id
```
Set-AtwsInvoice [-Id <Int64[]>] [-InvoiceNumber <String>] [-PaidDate <DateTime>] [-WebServiceDate <DateTime>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

### By_parameters
```
Set-AtwsInvoice [-PassThru] [-InvoiceNumber <String>] [-PaidDate <DateTime>] [-WebServiceDate <DateTime>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This function one or more objects of type \[Autotask.Invoice\] as input.
You can pipe the objects to the function or pass them using the -InputObject parameter.
You specify the property you want to set and the value you want to set it to using parameters.
The function modifies all objects and updates the online data through the Autotask Web Services API.
The function supports all properties of an \[Autotask.Invoice\] that can be updated through the Web Services API.
The function uses PowerShell parameter validation  and supports IntelliSense for selecting picklist values.

Entities that have fields that refer to the base entity of this CmdLet:

## EXAMPLES

### EXAMPLE 1
```
Set-AtwsInvoice -InputObject $Invoice [-ParameterName] [Parameter value]
Passes one or more [Autotask.Invoice] object(s) as a variable to the function and sets the property by name 'ParameterName' on ALL the objects before they are passed to the Autotask Web Service API and updated.
```

### EXAMPLE 2
```
Same as the first example, but now the objects are passed to the funtion through the pipeline, not passed as a parameter. The end result is identical.
```

### EXAMPLE 3
```
Gets the instance with Id 0 directly from the Web Services API, modifies a parameter and updates Autotask. This approach works with all valid parameters for the Get function.
```

### EXAMPLE 4
```
Gets multiple instances by Id, modifies them all and updates Autotask.
```

### EXAMPLE 5
```
-PassThru
Gets multiple instances by Id, modifies them all, updates Autotask and returns the updated objects.
```

## PARAMETERS

### -InputObject
An object that will be modified by any parameters and updated in Autotask

```yaml
Type: Invoice[]
Parameter Sets: Input_Object
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Id
The object.ids of objects that should be modified by any parameters and updated in Autotask

```yaml
Type: Int64[]
Parameter Sets: By_Id
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru
Return any updated objects through the pipeline

```yaml
Type: SwitchParameter
Parameter Sets: Input_Object, By_parameters
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -InvoiceNumber
Invoice Number

```yaml
Type: String
Parameter Sets: Input_Object, By_Id, By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PaidDate
Paid Date

```yaml
Type: DateTime
Parameter Sets: Input_Object, By_Id, By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WebServiceDate
Web Service Use Date

```yaml
Type: DateTime
Parameter Sets: Input_Object, By_Id, By_parameters
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

### [Autotask.Invoice[]]. This function takes one or more objects as input. Pipeline is supported.
## OUTPUTS

### Nothing or [Autotask.Invoice]. This function optionally returns the updated objects if you use the -PassThru parameter.
## NOTES
Related commands:
Get-AtwsInvoice

## RELATED LINKS
