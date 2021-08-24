# Deploy the solutioun with Azure Bicep

The deployment template contains two web apps pulling code from a GitHub repository. The two web apps are deployed to two differend regions, your resource groups region and another region of your choice. The template also deploys a Traffic Manager Profile with Performance as the routing method. The web apps are also added as endpoints in the Traffic Manager Profile. With the Traffic Manager users accessing the website are automatically routed to the closest web app based on the Traffic Managers latency table. 

For more info on Performance routing method go to: https://docs.microsoft.com/en-us/azure/traffic-manager/traffic-manager-routing-methods#performance-traffic-routing-method

*Regions, names and tiers are defined in the parameters. Change them to fit your environment before deployment!*

To deploy this solutioun you can use the following PowerShell command:
```powershell
az deployment group create --resource-group <ResourceGroupName> --template-file 'deployapp.bicep' -c
```
*The -c is used to check the deployment with a what-if and confirm the deployment.*

For more info on deplyment using bicep go to: https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/deploy-cli