resource myci 'Microsoft.ContainerRegistry/registries@2020-11-01-preview' = {
  name: 'githubregistry-ci-demo'
  sku: {
    name: 'Basic'
  }
  location: 'westeurope'
}

resource mykv 'Microsoft.KeyVault/vaults@2021-04-01-preview' = {
  name: 'githubregistry-kv-demo'
  location: 'westeurope'
  properties: {
    sku: {
      name: 'standard'
      family: 'A'
    }
    tenantId: subscription().tenantId
  }
}

output keyvaultUri string = mykv.properties.vaultUri
