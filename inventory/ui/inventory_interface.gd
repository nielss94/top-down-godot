class_name InventoryInterface extends Control

@onready var player_inventory_ui: InventoryUI = $PlayerInventoryUI
@onready var player_equipment_ui: EquipmentInventoryUI = $PlayerEquipmentUI

func _ready():
	Events.toggle_inventory.connect(toggle_inventory)
	Events.player_inventory_init.connect(player_inventory_ui.set_inventory)
	Events.player_equipment_inventory_init.connect(player_equipment_ui.set_equipment_inventory)
	Events.player_inventory_changed.connect(player_inventory_ui.redraw)
	Events.player_equipment_inventory_changed.connect(player_equipment_ui.redraw)

func toggle_inventory():
	visible = not visible
