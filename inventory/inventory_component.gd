class_name InventoryComponent extends Node

signal inventory_changed

@export var inventory: Inventory

func add(item: Item):
	inventory.add(item)
	inventory_changed.emit()

func remove(item: Item):
	inventory.remove(item)
	inventory_changed.emit()
