az provider register --namespace Microsoft.KeyVault

az keyvault create \
    --resource-group rg-money-hub \
    --name kv-moneyhub-rm566357 \
    --location eastus \
    --sku standard \
    --enable-rbac-authorization true \
    --output table

az role assignment create \
  --assignee $(az account show --query user.name -o tsv) \
  --role "Key Vault Administrator" \
  --scope /subscriptions/$(az account show --query id -o tsv)/resourceGroups/$resourceGroup/providers/Microsoft.KeyVault/vaults/$keyVaultName

# az keyvault secret set \
#   --vault-name kv-moneyhub-rm566357 \
#   --name mysql-root-password \
#   --value "$MYSQL_ROOT_PASSWORD"