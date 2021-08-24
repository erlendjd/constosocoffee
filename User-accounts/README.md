# Assign the roles required

This is a guide to how you can assign the roles I assigned the users in my solutioun.

## Bob - Global Administrator

To assign Bob the Global Administrator role we need Bob's ObjectId and the Global Administrator Role's ObjectId. This is used in the command to add bob as a rolemember.

To get the role's ObjectId run the following command:

```powershell
$roleObjectId = (Get-AzureADDirectoryRole -Filter "DisplayName eq 'Global Administrator'" | Select-Object ObjectID).ObjectId
```

To get the Bob's ObjectId run the following command:

```powershell
$userObjectId = (Get-AzureADUser -Filter "DisplayName eq 'bob'" | Select-Object ObjectId).ObjectId
```

To assign Bob the role run the following command:

```powershell
Add-AzureADDirectoryRoleMember -ObjectId $roleObjectId -RefObjectId $userObjectId
```

Finnaly we can confirm that Bob has been assigned the role by running the follwong command:

```powershell
Get-AzureADDirectoryRoleMember -ObjectId $roleObjectId
```

The command above lists the members of the Global Administrator role, the output should look something like this:

```
ObjectId                             DisplayName            UserPrincipalName
--------                             -----------            -----------------
faf5b52a-33bc-439f-8c44-d88be516eba1 Bob                    bob@contosocoffee.com
```

## Dave - Contributor in the resource group

To assign Dave the Contributor Role scoped at the resource group run the following command: 

```powershell
New-AzRoleAssignment -SignInName "dave@contosocoffee.com" -RoleDefinitionName "Contributor" -ResourceGroupName "ContosoCoffee"
```

Confirm that Dave has been assigned the role with the following command:

```powershell
Get-AzRoleAssignment -ResourceGroupName "ContosoCoffee" -SignInName "dave@contosocoffee.com" | Select-Object DisplayName, RoleDefinitionName, Scope
```

The output should look something like this:

```
DisplayName RoleDefinitionName Scope
----------- ------------------ -----
Dave        Contributor        /subscriptions/<SubscriptionID>/resourceGroups/ContosoCoffee
```

## Mark - Reader in the resource group

To assign Mark the Reader role scoped at the resource group run the following command:

```powershell
New-AzRoleAssignment -SignInName "mark@contosocoffee" -RoleDefinitionName "Reader" -ResourceGroupName "ContosoCoffee"
```

Confirm that Mark has been assigned the role with the following command:

```powershell
Get-AzRoleAssignment -ResourceGroupName "ContosoCoffee" -SignInName "mark@contosocoffee.com" | Select-Object DisplayName, RoleDefinitionName, Scope
```

The output should look something like this:

```
DisplayName RoleDefinitionName Scope
----------- ------------------ -----
Mark        Reader             /subscriptions/<SubscriptionID>/resourceGroups/ContosoCoffee
```