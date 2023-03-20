class_name InventoryInterface extends Control

@onready var player_inventory: InventoryUI = $PlayerInventory

func _ready():
	Events.player_inventory_changed.connect(_player_inventory_changed)

func set_player_inventory(inventory: Inventory):
	player_inventory.set_inventory(inventory)

func _player_inventory_changed():
	player_inventory.redraw()
