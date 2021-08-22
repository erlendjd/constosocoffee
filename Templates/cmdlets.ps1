# Deploy template with What-if check and confirmation (-c)
az deployment group create --resource-group YourRG --template-file 'yourtemplate' -c

az deployment group create --resource-group ContosoCoffee --template-file 'deployment.bicep' -c