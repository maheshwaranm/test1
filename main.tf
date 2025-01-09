
resource "random_string" "random" {
  length  = 8
  special = false
  upper   = false
  lower   = true
}

resource "azurerm_resource_group" "cicd1" {
  name     = var.rg_name
  location = var.location
}
resource "azurerm_storage_account" "storage1" {
  name                     = "${lower(var.rg_name)}${random_string.random.result}"
  resource_group_name      = azurerm_resource_group.cicd1.name
  location                 = azurerm_resource_group.cicd1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}