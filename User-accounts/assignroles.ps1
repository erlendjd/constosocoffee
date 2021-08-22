# Assign role with resource group as scope
New-AzRoleAssignment -SignInName "<emailOrUserprincipalname>" -RoleDefinitionName "<roleName>" -ResourceGroupName "<resourceGroupName>"

# Assign role with subscription as scope
New-AzRoleAssignment -SignInName "<emailOrUserprincipalname>" -RoleDefinitionName "<roleName>" -Scope "/subscriptions/<subscriptionId>"


# The following lines show how to assign the roles assigned in this solution (Replace <content> with your desired content)
New-AzRoleAssignment -SignInName "bob@<suffix>" -RoleDefinitionName "Owner" -Scope "/subscriptions/<subscriptionId>"
New-AzRoleAssignment -SignInName "dave@<suffix>" -RoleDefinitionName "Owner" -ResourceGroupName "<resourceGroupName>"
New-AzRoleAssignment -SignInName "dave@<suffix>" -RoleDefinitionName "Reader" -ResourceGroupName "<resourceGroupName>"