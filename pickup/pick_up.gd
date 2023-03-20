class_name PickUp extends Sprite2D

@export var item: Item

func set_item(item: Item):
	self.item = item
	texture = item.sprite

func _on_interactable_area_interacted():
	Events.pickup_item.emit(item)
	queue_free()
