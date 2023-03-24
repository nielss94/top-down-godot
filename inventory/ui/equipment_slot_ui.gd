class_name EquipmentSlotUI extends Panel

signal right_clicked(equipment_type: Equipment.Type)

@onready var texture_rect = $MarginContainer/TextureRect
@onready var quantity_label = $QuantityLabel

var hovering: bool = false
var equipment: Equipment

func _process(delta):
	if Input.is_action_just_pressed("right_mouse") and hovering and equipment:
		right_clicked.emit(equipment.type)
		Events.player_equipment_inventory_changed.emit()

func set_equipment(equipment: Equipment):
	self.equipment = equipment
	
	if equipment:
		texture_rect.texture = equipment.sprite
		tooltip_text = "%s\n%s" % [equipment.name, equipment.description]
		tooltip_text += "\nStr %s\nInt %s\nDex %s\nLuk %s" % [equipment.strength, equipment.intellect, equipment.dexterity, equipment.luck]		
	else:
		texture_rect.texture = null
		tooltip_text = ""

func _on_mouse_entered():
	hovering = true;

func _on_mouse_exited():
	hovering = false;
