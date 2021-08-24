param repoURL string = 'https://github.com/erlendjd/CoffeeShopTemplate.git'
param branch string = 'main'

param location1 string = resourceGroup().location
param serverFarm1Name string = 'ASP-CCoffee-UK'
param webApp1Name string = 'CCoffeeUK'

param location2 string = 'eastus'
param serverFarm2Name string = 'ASP-CCoffee-US'
param webApp2Name string = 'CCoffeeUS'

param aspSKU string = 'S1'
param trafficManagerName string = 'ContosoCoffeeTM'
param trafficManagerDNSName string = 'ContosoCoffee'

resource serverFarm1 'Microsoft.Web/serverfarms@2021-01-15' = {
  name: serverFarm1Name
  location: location1
  sku: {
    name: aspSKU
    tier: 'Standard'
    capacity: 1
  }
  kind: 'app'
  properties: {}
}

resource webApplication1 'Microsoft.Web/sites@2021-01-15' = {
  name: webApp1Name
  location: location1
  properties: {
    serverFarmId: serverFarm1.id
  }
  resource app1Repository 'sourcecontrols@2018-02-01' = {
    name: 'web'
    properties: {
      repoUrl: repoURL
      branch: branch
      isManualIntegration: true
      deploymentRollbackEnabled: true
      isMercurial: false
    }
  }
}

resource serverFarm2 'Microsoft.Web/serverfarms@2021-01-15' = {
  name: serverFarm2Name
  location: location2
  sku: {
    name: aspSKU
    tier: 'Standard'
    capacity: 1
  }
  kind: 'app'
  properties: {}
}

resource webApplication2 'Microsoft.Web/sites@2021-01-15' = {
  name: webApp2Name
  location: location2
  properties: {
    serverFarmId: serverFarm2.id
  }
  resource app2Repository 'sourcecontrols@2018-02-01' = {
    name: 'web'
    properties: {
      repoUrl: repoURL
      branch: branch
      isManualIntegration: true
      deploymentRollbackEnabled: true
      isMercurial: false
    }
  }
}

resource trafficManagerProfile 'Microsoft.Network/trafficManagerProfiles@2018-04-01' = {
  name: trafficManagerName
  location: 'global'
  properties: {
    profileStatus: 'Enabled'
    trafficRoutingMethod: 'Performance'
    dnsConfig: {
      relativeName: trafficManagerDNSName
      ttl: 60
    }
    monitorConfig: {
      protocol: 'HTTP'
      port: 80
      path: '/'
      intervalInSeconds: 30
      timeoutInSeconds: 10
      toleratedNumberOfFailures: 3
    }
    endpoints: [
      {
        name: webApp1Name
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: webApplication1.id
          endpointStatus: 'Enabled'
        }
      }
      {
        name: webApp2Name
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: webApplication2.id
          endpointStatus: 'Enabled'
        }
      }
    ]
  }
}
