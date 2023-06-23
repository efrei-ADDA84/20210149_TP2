data "azurerm_subnet" "tp4" {
	name = var.subnet
	virtual_network_name = var.network
	resource_group_name = var.resource_group
}

output "subnet_id" {
	value = data.azurerm_subnet.tp4.id
}

data "azurerm_virtual_network" "tp4" {
	name = "network-tp4"
	resource_group_name = var.resource_group
}

output "virtual_network_id" {
	value = data.azurerm_virtual_network.tp4.id
}



