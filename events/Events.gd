extends Node

# inventory
signal toggle_inventory
signal player_inventory_init(inventory: Inventory)
signal player_inventory_changed
signal player_equipment_inventory_init(equipment_inventory: EquipmentInventory)
signal player_equipment_inventory_changed

signal pickup_item(item)
signal enemy_died(position)


# equipment
signal equip_item(equipment: Equipment)
signal unequip_item(equipment: Equipment)
