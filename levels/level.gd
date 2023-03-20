extends Node2D

@onready var camera = $Camera2D
@onready var player: Player = $Player

@onready var inventory_interface: InventoryInterface = $UI/InventoryInterface

func _ready():
	player.toggle_inventory.connect(toggle_inventory)
	player.inventory_changed.connect(player_inventory_changed)
	inventory_interface.set_player_inventory(player.inventory)
	camera.player = player

func toggle_inventory():
	inventory_interface.visible = not inventory_interface.visible

func player_inventory_changed():
	inventory_interface.set_player_inventory(player.inventory)
