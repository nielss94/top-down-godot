extends Node

# inventory
signal toggle_inventory
signal player_inventory_init(inventory: Inventory)
signal player_inventory_changed
signal player_equipment_inventory_init(equipment_inventory: EquipmentInventory)
signal player_equipment_inventory_changed

signal pickup_success(unique_id)
signal pickup_item(item)
signal drop_item(item, position)
signal enemy_died(position)


# equipment
signal equip_item(equipment: Equipment)
signal unequip_item(equipment: Equipment)
