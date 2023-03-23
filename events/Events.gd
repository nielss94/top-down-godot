extends Node

# inventory
signal toggle_inventory
signal player_inventory_init(inventory: Inventory)
signal player_inventory_changed
signal player_equipment_inventory_changed(equipment_inventory: EquipmentInventory)

signal pickup_item(item)
signal enemy_died(position)
