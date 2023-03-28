class_name LootManager extends Node

@export var items: Array[Item]

var pickup = preload("res://pickup/pick_up.tscn")

func _ready():
	Events.enemy_died.connect(try_spawn_loot)
	Events.drop_item.connect(drop_item)

func try_spawn_loot(position):
	if randf() > .5:
		var item = items.pick_random()
		var new_item = null
		if item is Equipment:
			new_item = Equipment.create_equipment(item as Equipment)
		else:
			new_item = Item.create_item(item)
			
		drop_item(new_item, position)

func drop_item(item: Item, position: Vector2):
	var new_pickup = pickup.instantiate()
	(new_pickup as PickUp).set_item(item);
	new_pickup.position = position
	get_tree().current_scene.call_deferred("add_child", new_pickup)
