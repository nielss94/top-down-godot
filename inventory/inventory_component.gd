class_name InventoryComponent extends Node

signal inventory_changed

@export var inventory: Inventory

func has_room_for(item: Item) -> bool:
	return inventory.has_room_for(item)

func add(item: Item):
	inventory.add(item)
	inventory_changed.emit()

func remove(item: Item):
	inventory.remove(item)
	inventory_changed.emit()
