resource "azurerm_linux_virtual_machine" "tp4-devops"{
  name                = "devops-20210149"
  location            = var.location
  resource_group_name = var.resource_group
  size                = "Standard_D2s_v3"
  admin_username      = "devops"
  disable_password_authentication = true
  network_interface_ids = [azurerm_network_interface.tp4-devops.id]
  admin_ssh_key {
     username = "devops"
     public_key = tls_private_key.ssh.public_key_openssh
   }
  os_disk {
    name              = "osdisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

}

