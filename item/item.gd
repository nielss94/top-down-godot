class_name Item extends Resource

@export var name: String
@export var description: String
@export var sprite: Texture2D
@export var stackable: bool = false

@export var unique_id: String

static func create_item(item: Item) -> Item:
	var new_item = Item.new()
	
	new_item.name = item.name
	new_item.description = item.description
	new_item.sprite = item.sprite
	new_item.stackable = item.stackable

	new_item.unique_id = UUID.v4()
	
	return new_item
