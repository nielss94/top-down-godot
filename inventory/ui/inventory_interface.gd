class_name InventoryInterface extends Control

@onready var player_inventory_ui: InventoryUI = $PlayerInventoryUI

func _ready():
	Events.toggle_inventory.connect(toggle_inventory)
	Events.player_inventory_init.connect(player_inventory_ui.set_inventory)
	Events.player_inventory_changed.connect(player_inventory_ui.redraw)

func toggle_inventory():
	visible = not visible
