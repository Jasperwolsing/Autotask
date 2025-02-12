---
external help file: Autotask-help.xml
Module Name: Autotask
online version:
schema: 2.0.0
---

# New-AtwsExpenseReport

## SYNOPSIS
This function creates a new ExpenseReport through the Autotask Web Services API.
All required properties are marked as required parameters to assist you on the command line.

## SYNTAX

### By_parameters (Default)
```
New-AtwsExpenseReport [-AmountDue <Double>] [-ApprovedDate <DateTime>] [-ApproverID <Int32>]
 [-BusinessDivisionSubdivisionID <Int32>] [-CashAdvanceAmount <Double>] [-DepartmentNumber <String>]
 [-ExpenseTotal <Double>] -Name <String> [-QuickBooksReferenceNumber <String>]
 [-ReimbursementCurrencyAmountDue <Double>] [-ReimbursementCurrencyCashAdvanceAmount <Double>]
 [-ReimbursementCurrencyID <Int32>] [-RejectionReason <String>] [-Status <String>] [-Submit <Boolean>]
 [-SubmitDate <DateTime>] -SubmitterID <Int32> -WeekEnding <DateTime> [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Input_Object
```
New-AtwsExpenseReport [-InputObject <ExpenseReport[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The function supports all properties of an \[Autotask.ExpenseReport\] that can be updated through the Web Services API.
The function uses PowerShell parameter validation  and supports IntelliSense for selecting picklist values.
Any required paramterer is marked as Mandatory in the PowerShell function to assist you on the command line.

If you need very complicated queries you can write a filter directly and pass it using the -Filter parameter.
To get the ExpenseReport with Id number 0 you could write 'New-AtwsExpenseReport -Id 0' or you could write 'New-AtwsExpenseReport -Filter {Id -eq 0}.

'New-AtwsExpenseReport -Id 0,4' could be written as 'New-AtwsExpenseReport -Filter {id -eq 0 -or id -eq 4}'.
For simple queries you can see that using parameters is much easier than the -Filter option.
But the -Filter option supports an arbitrary sequence of most operators (-eq, -ne, -gt, -ge, -lt, -le, -and, -or, -beginswith, -endswith, -contains, -like, -notlike, -soundslike, -isnotnull, -isnull, -isthisday).
As you can group them using parenthesis '()' you can write arbitrarily complex queries with -Filter. 

To create a new ExpenseReport you need the following required fields:
 -Name
 -SubmitterID
 -WeekEnding

Entities that have fields that refer to the base entity of this CmdLet:

## EXAMPLES

### EXAMPLE 1
```
$result = New-AtwsExpenseReport -Name [Value] -SubmitterID [Value] -WeekEnding [Value]
Creates a new [Autotask.ExpenseReport] through the Web Services API and returns the new object.
```

### EXAMPLE 2
```
$result = Get-AtwsExpenseReport -Id 124 | New-AtwsExpenseReport 
Copies [Autotask.ExpenseReport] by Id 124 to a new object through the Web Services API and returns the new object.
```

### EXAMPLE 3
```
Copies [Autotask.ExpenseReport] by Id 124 to a new object through the Web Services API, passes the new object to the Set-AtwsExpenseReport to modify the object.
```

### EXAMPLE 4
```
-Passthru
Copies [Autotask.ExpenseReport] by Id 124 to a new object through the Web Services API, passes the new object to the Set-AtwsExpenseReport to modify the object and returns the new object.
```

## PARAMETERS

### -InputObject
An array of objects to create

```yaml
Type: ExpenseReport[]
Parameter Sets: Input_Object
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -AmountDue
Amount Due

```yaml
Type: Double
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -ApprovedDate
Approved Date

```yaml
Type: DateTime
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ApproverID
Approver ID

```yaml
Type: Int32
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -BusinessDivisionSubdivisionID
Business Division Subdivision ID

```yaml
Type: Int32
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -CashAdvanceAmount
Cash Advance Amount

```yaml
Type: Double
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -DepartmentNumber
Department Number

```yaml
Type: String
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExpenseTotal
Expense Total

```yaml
Type: Double
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Name

```yaml
Type: String
Parameter Sets: By_parameters
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -QuickBooksReferenceNumber
Quick Books Reference Number

```yaml
Type: String
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ReimbursementCurrencyAmountDue
Reimbursement Currency Amount Due

```yaml
Type: Double
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -ReimbursementCurrencyCashAdvanceAmount
Reimbursement Currency Cash Advance Amount

```yaml
Type: Double
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -ReimbursementCurrencyID
Reimbursement Currency ID

```yaml
Type: Int32
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -RejectionReason
Rejection Reason

```yaml
Type: String
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Status
Status

```yaml
Type: String
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Submit
Submit

```yaml
Type: Boolean
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubmitDate
Submit Date

```yaml
Type: DateTime
Parameter Sets: By_parameters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubmitterID
Submitter ID

```yaml
Type: Int32
Parameter Sets: By_parameters
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -WeekEnding
Period Ending

```yaml
Type: DateTime
Parameter Sets: By_parameters
Aliases:

Required: True
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

### [Autotask.ExpenseReport]. This function outputs the Autotask.ExpenseReport that was created by the API.
## NOTES
Related commands:
Get-AtwsExpenseReport
 Set-AtwsExpenseReport

## RELATED LINKS
