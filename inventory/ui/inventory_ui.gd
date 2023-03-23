class_name InventoryUI extends PanelContainer

const slot_scene = preload("res://inventory/ui/slot.tscn")

@onready var item_grid: GridContainer = $MarginContainer/ItemGrid

@export var is_equipment_inventory: bool = false
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

		(new_slot as SlotUI).right_clicked.connect(ding)
func redraw():
	draw_slot_grid()

func ding(slot_ui: SlotUI):
	if slot_ui.slot.item and slot_ui.slot.item is Equipment:
		print("right click %s" % slot_ui.slot.item.name)
		if is_equipment_inventory:
			Events.pickup_item.emit(slot_ui.slot.item)
			Events.unequip_item.emit(slot_ui.slot.item)
			Events.equipment_inventory_changed.emit()
		else:
			Events.equip_item.emit(slot_ui.slot.item)
			Events.player_inventory_changed.emit()
		slot_ui.slot.item = null;
		slot_ui.set_slot(slot_ui.slot)
	else:
		print("right click empty slot")
