class_name LootManager extends Node

@export var items: Array[Item]

var pickup = preload("res://pickup/pick_up.tscn")

func _ready():
	Events.enemy_died.connect(try_spawn_loot)

func try_spawn_loot(position):
	if randf() > .5:
		var item = items.pick_random()
		
		var new_pickup = pickup.instantiate()
		(new_pickup as PickUp).set_item(item);
		new_pickup.position = position
		get_tree().current_scene.add_child(new_pickup)
		
