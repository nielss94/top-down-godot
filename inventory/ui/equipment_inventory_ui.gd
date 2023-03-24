class_name EquipmentInventoryUI extends PanelContainer

@onready var helmet_slot: EquipmentSlotUI = $MarginContainer/GridContainer/HelmetSlot
@onready var armor_slot: EquipmentSlotUI = $MarginContainer/GridContainer/ArmorSlot
@onready var leggings_slot: EquipmentSlotUI = $MarginContainer/GridContainer/LeggingsSlot
@onready var boots_slot: EquipmentSlotUI = $MarginContainer/GridContainer/BootsSlot
@onready var weapon_slot: EquipmentSlotUI = $MarginContainer/GridContainer/WeaponSlot

var equipment_inventory: EquipmentInventory

func set_equipment_inventory(equipment_inventory: EquipmentInventory):
	self.equipment_inventory = equipment_inventory
	helmet_slot.right_clicked.connect(equipment_inventory.unequip)
	armor_slot.right_clicked.connect(equipment_inventory.unequip)
	leggings_slot.right_clicked.connect(equipment_inventory.unequip)
	boots_slot.right_clicked.connect(equipment_inventory.unequip)
	weapon_slot.right_clicked.connect(equipment_inventory.unequip)
	draw_slots()

func draw_slots():
	helmet_slot.set_equipment(equipment_inventory.helmet)
	armor_slot.set_equipment(equipment_inventory.armor)
	leggings_slot.set_equipment(equipment_inventory.leggings)
	boots_slot.set_equipment(equipment_inventory.boots)
	weapon_slot.set_equipment(equipment_inventory.weapon)

func redraw():
	draw_slots()

