param sites_githubdemoweb_name string = 'githubdemoweb'
param serverfarms_GitHubDemo_name string = 'GitHubDemo'

resource serverfarms_GitHubDemo_name_resource 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: serverfarms_GitHubDemo_name
  location: resourceGroup().location
  sku: {
    name: 'F1'
    tier: 'Free'
    size: 'F1'
    family: 'F'
    capacity: 0
  }
  kind: 'app'
}

resource sites_githubdemoweb_name_resource 'Microsoft.Web/sites@2022-03-01' = {
  name: sites_githubdemoweb_name
  location: resourceGroup().location
  kind: 'app'
  properties: {
    enabled: true
    serverFarmId: serverfarms_GitHubDemo_name_resource.id
    reserved: false
  }
}

resource sites_githubdemoweb_name_web 'Microsoft.Web/sites/config@2022-03-01' = {
  parent: sites_githubdemoweb_name_resource
  name: 'web'
  properties: {
    netFrameworkVersion: 'v4.0'
  }
}
