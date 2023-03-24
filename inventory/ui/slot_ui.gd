class_name SlotUI extends Panel

signal right_clicked(slot: Slot)

@onready var texture_rect = $MarginContainer/TextureRect
@onready var quantity_label = $QuantityLabel

var slot: Slot
var hovering: bool = false

func _process(delta):
	if Input.is_action_just_pressed("right_mouse") and hovering and slot.item and slot.item is Equipment:
		right_clicked.emit(slot)

func set_slot(slot: Slot):
	self.slot = slot
	
	if not slot.item:
		return
		
	texture_rect.texture = slot.item.sprite
	tooltip_text = "%s\n%s" % [slot.item.name, slot.item.description]
	if slot.item is Equipment:
		var eq = slot.item as Equipment
		tooltip_text += "\nStr %s\nInt %s\nDex %s\nLuk %s" % [eq.strength, eq.intellect, eq.dexterity, eq.luck]

	if slot.quantity > 1:
		quantity_label.text = "x%s" % slot.quantity
		quantity_label.show() 

func _on_mouse_entered():
	hovering = true;

func _on_mouse_exited():
	hovering = false;
