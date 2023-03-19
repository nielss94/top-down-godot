class_name InventoryInterface extends Control

@onready var player_inventory: InventoryUI = $PlayerInventory

func set_player_inventory(inventory: Inventory):
	player_inventory.set_inventory(inventory)
