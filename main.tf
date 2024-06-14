resource "azurerm_resource_group" "ABH-Redemption" {
  name     = "ABH-Redemption"
  location = "Germany West Central"
}

resource "azurerm_storage_account" "ABH-Storage-Account" {
  name                     = "abhstore"
  resource_group_name      = azurerm_resource_group.ABH-Redemption.name
  location                 = azurerm_resource_group.ABH-Redemption.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "ABH-Container" {
  name                  = "abhdatapp"
  storage_account_name  = azurerm_storage_account.ABH-Storage-Account.name
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "Data-PP" {
  name                   = "datapp"
  storage_account_name   = azurerm_storage_account.ABH-Storage-Account.name
  storage_container_name = azurerm_storage_container.ABH-Container.name
  type                   = "Block"
  source                 = "/mnt/c/Users/Admin/Pictures/Camera Roll/Gojo.png"
  content_type           = "image/png"
}
