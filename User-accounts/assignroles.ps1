# Azure RBAC Role Assignments

# Assign role with resource group as scope
New-AzRoleAssignment -SignInName "<emailOrUserprincipalname>" -RoleDefinitionName "<roleName>" -ResourceGroupName "<resourceGroupName>"

# Assign role with subscription as scope
New-AzRoleAssignment -SignInName "<emailOrUserprincipalname>" -RoleDefinitionName "<roleName>" -Scope "/subscriptions/<subscriptionId>"

# The following lines show how to assign the roles assigned in this solution (Replace <content> with your desired content)
New-AzRoleAssignment -SignInName "dave@contosocoffee.com" -RoleDefinitionName "Contributor" -ResourceGroupName "<resourceGroupName>"
New-AzRoleAssignment -SignInName "mark@contosocoffee" -RoleDefinitionName "Reader" -ResourceGroupName "<resourceGroupName>"



# Azure AD Role Assignments

# To assign bob the Global Administrator:
# Variable for the displayname of the user you want to assign the role to
$displayName = "bob"

# Get the ObjectId of the role
$roleObjectId = (Get-AzureADDirectoryRole -Filter "DisplayName eq 'Global Administrator'" | Select-Object ObjectID).ObjectId

# Get the ObjectId of the user
$userObjectId = (Get-AzureADUser -Filter "DisplayName eq $displayName" | Select-Object ObjectId).ObjectId

# Assign the role to the user (Add the user as a role member)
Add-AzureADDirectoryRoleMember -ObjectId $roleObjectId -RefObjectId $userObjectId

# Run the following command to see if the user was added as a role memeber
Get-AzureADDirectoryRoleMember -ObjectId $roleObjectId

# In case you want to remove the role assignment
Remove-AzureADDirectoryRoleMember -ObjectId $roleObjectId -MemberId $userObjectId