class_name EquipmentInventoryComponent extends Node

signal equipment_inventory_changed

@export var inventory: EquipmentInventory

func _ready():
	Events.equip_item.connect(equip)
	Events.unequip_item.connect(unequip)

func equip(equipment: Equipment):
	inventory.equip(equipment)
	equipment_inventory_changed.emit()

func unequip(equipment: Equipment):
	inventory.unequip(equipment.type)
	equipment_inventory_changed.emit()
