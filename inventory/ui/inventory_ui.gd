class_name InventoryUI extends PanelContainer

const slot_scene = preload("res://inventory/ui/slot.tscn")

@onready var item_grid: GridContainer = $MarginContainer/ItemGrid

var inventory: Inventory

func set_inventory(inventory: Inventory):
	self.inventory = inventory
	draw_slot_grid()

func draw_slot_grid():
	if not inventory:
		pass

	for child in item_grid.get_children():
		child.queue_free()
		
	for slot in inventory.slots:
		var new_slot = slot_scene.instantiate()
		item_grid.add_child(new_slot)
		
		if slot:
			new_slot.set_slot(slot)

func redraw():
	draw_slot_grid()
