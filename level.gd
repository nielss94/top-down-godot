extends Node2D

@onready var camera = $Camera2D
@onready var player = $Player

var enemy = preload("res://enemy/enemy.tscn")

func _ready():
	camera.player = player
	spawn_enemy()
	
func spawn_enemy():
	var new_enemy = enemy.instantiate()
	
	add_child(new_enemy)

	await get_tree().create_timer(2.0).timeout
	
	spawn_enemy()
