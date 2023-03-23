class_name EquipmentInventoryComponent extends Node

signal equipment_inventory_changed

@export var inventory: EquipmentInventory
const helmet = preload("res://item/equipment/wooden_helmet.tres")
const armor = preload("res://item/equipment/wooden_armor.tres")

func _process(delta):
	if Input.is_action_just_pressed("L"):
		equip(helmet)
	if Input.is_action_just_pressed("M"):
		equip(armor)

func equip(equipment: Equipment):
	inventory.equip(equipment)
	equipment_inventory_changed.emit()
