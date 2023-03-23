extends Node2D

@onready var camera = $Camera2D
@onready var player: Player = $Player

@onready var inventory_interface: InventoryInterface = $UI/InventoryInterface

func _ready():
	player.toggle_inventory.connect(toggle_inventory)
	inventory_interface.set_player_inventory(player.inventory_component.inventory)
	inventory_interface.set_equipment_inventory(player.equipment_inventory_component.inventory)

func toggle_inventory():
	inventory_interface.visible = not inventory_interface.visible

