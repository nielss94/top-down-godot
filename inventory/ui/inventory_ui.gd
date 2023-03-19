class_name InventoryUI extends PanelContainer

const slot_scene = preload("res://inventory/ui/slot.tscn")

@onready var item_grid: GridContainer = $MarginContainer/ItemGrid

func set_inventory(inventory: Inventory):
	generate_slot_grid(inventory.slots)

func generate_slot_grid(slots: Array[Slot]):
	for child in item_grid.get_children():
		child.queue_free()
		
	for slot in slots:
		var new_slot = slot_scene.instantiate()
		item_grid.add_child(new_slot)
		
		if slot:
			new_slot.set_slot(slot)
