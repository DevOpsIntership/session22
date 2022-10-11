param appservice string = 'appserviceadkwolek'
param webSiteName string = 'adkwolegcatalogapi'
param sku string = 'B1'
param linuxFxVersion string = 'DOCKER|adamkwolek/catalogapi'
param location string = resourceGroup().location  
param tier string = 'Basic'

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appservice
  location: location
  properties: {
    reserved: true
    
  }
  sku: {
    name: sku
    tier: tier
  }
  kind: 'linux'
}
resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: webSiteName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion

    }
    httpsOnly:false
  }
}
