class_name InventoryUI extends PanelContainer

const slot_ui = preload("res://inventory/ui/slot_ui.tscn")

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
		var new_slot_ui = slot_ui.instantiate()
		item_grid.add_child(new_slot_ui)
		
		if slot:
			new_slot_ui.set_slot(slot)

func redraw():
	draw_slot_grid()
