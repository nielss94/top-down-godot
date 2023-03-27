class_name PickUp extends Sprite2D

@export var item: Item

func _ready():
	Events.pickup_success.connect(_on_pickup_success)

func set_item(item: Item):
	self.item = item
	texture = item.sprite

func _on_interactable_area_interacted():
	Events.pickup_item.emit(item)

func _on_pickup_success(unique_id: String):
	if item.unique_id == unique_id:
		queue_free()
