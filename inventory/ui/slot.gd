extends Panel

var slot: Slot
@onready var texture_rect = $MarginContainer/TextureRect
@onready var quantity_label = $QuantityLabel

func set_slot(slot: Slot):
	self.slot = slot
	
	if not slot.item:
		return
		
	texture_rect.texture = slot.item.sprite
	tooltip_text = "%s\n%s" % [slot.item.name, slot.item.description]
	if slot.quantity > 1:
		quantity_label.text = "x%s" % slot.quantity
		quantity_label.show() 
