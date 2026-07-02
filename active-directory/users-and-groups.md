# Active Directory Users and Groups

## Domain

| Setting | Value |
|---|---|
| Domain | greentech.local |
| Domain Controller | GT-DC01 |
| NetBIOS Name | GREENTECH |

## Organizational Units

The following OU structure was created for GreenTech Solutions AS:

| OU Name | Purpose |
|---|---|
| GreenTech | Main company OU |
| Users | Stores standard user accounts |
| Groups | Stores security groups |
| Computers | Stores domain-joined computers |
| Service Accounts | Stores service accounts |

## Security Groups

| Group Name | Purpose |
|---|---|
| GG_IT_Admins | IT administrator users |
| GG_HR_Users | HR department users |
| GG_Finance_Users | Finance department users |
| GG_Sales_Users | Sales department users |

## Test Users

| Name | Username | Group |
|---|---|---|
| Alice Hansen | alice.hansen | GG_IT_Admins |
| Jonas Berg | jonas.berg | GG_HR_Users |
| Sara Nilsen | sara.nilsen | GG_Finance_Users |
| Omar Ali | omar.ali | GG_Sales_Users |

## PowerShell Commands Used

```powershell
New-ADOrganizationalUnit -Name "GreenTech" -Path "DC=greentech,DC=local"
New-ADOrganizationalUnit -Name "Users" -Path "OU=GreenTech,DC=greentech,DC=local"
New-ADOrganizationalUnit -Name "Groups" -Path "OU=GreenTech,DC=greentech,DC=local"
New-ADOrganizationalUnit -Name "Computers" -Path "OU=GreenTech,DC=greentech,DC=local"
New-ADOrganizationalUnit -Name "Service Accounts" -Path "OU=GreenTech,DC=greentech,DC=local"