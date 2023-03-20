class_name InventoryComponent extends Node

@export var inventory: Inventory

func _process(delta):
	if Input.is_action_just_pressed("L"):
		var helmet = load("res://item/equipment/wooden_helmet.tres")
		inventory.add(helmet)

func add(item: Item):
	inventory.add(item)
