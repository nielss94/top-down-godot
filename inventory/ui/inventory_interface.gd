class_name InventoryInterface extends Control

@onready var player_inventory: InventoryUI = $PlayerInventory
@onready var equipment_inventory: InventoryUI = $EquipmentInventory

func _ready():
	Events.player_inventory_changed.connect(_player_inventory_changed)
	Events.equipment_inventory_changed.connect(_equipment_inventory_changed)

func set_player_inventory(inventory: Inventory):
	player_inventory.set_inventory(inventory)
	
func set_equipment_inventory(inventory: Inventory):
	equipment_inventory.set_inventory(inventory)

func _player_inventory_changed():
	player_inventory.redraw()

func _equipment_inventory_changed():
	equipment_inventory.redraw()
