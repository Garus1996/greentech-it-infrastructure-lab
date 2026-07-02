# Shared Folder Permissions

## Overview

Shared folders were created on the Windows Server domain controller to simulate departmental file shares for GreenTech Solutions AS.

## Folder Structure

| Folder Path | Share Name | Purpose |
|---|---|---|
| C:\CompanyShares\HR | HR | HR department files |
| C:\CompanyShares\Finance | Finance | Finance department files |
| C:\CompanyShares\Sales | Sales | Sales department files |
| C:\CompanyShares\IT | IT | IT administration files |

## Access Control Design

| Share | Group Access |
|---|---|
| HR | GG_HR_Users, GG_IT_Admins, Domain Admins |
| Finance | GG_Finance_Users, GG_IT_Admins, Domain Admins |
| Sales | GG_Sales_Users, GG_IT_Admins, Domain Admins |
| IT | GG_IT_Admins, Domain Admins |

## Validation

The following commands were used to test that the shares were reachable:

```powershell
Test-Path "\\GT-DC01\HR"
Test-Path "\\GT-DC01\Finance"
Test-Path "\\GT-DC01\Sales"
Test-Path "\\GT-DC01\IT"