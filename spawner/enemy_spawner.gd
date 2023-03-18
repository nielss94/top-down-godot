extends Node2D

@export_category("Spawn options")
@export var minX: float
@export var maxX: float
@export var minY: float
@export var maxY: float

var enemy = preload("res://enemy/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn()
	
func spawn():
	var new_enemy = enemy.instantiate()
	
	new_enemy.position = Vector2(randf_range(minX, maxX), randf_range(minY, maxY))
	
	add_child(new_enemy)

	await get_tree().create_timer(2.0).timeout
	
	spawn()