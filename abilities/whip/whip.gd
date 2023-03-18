extends Node2D

@onready var visual: Sprite2D = $Sprite2D
@onready var collision_shape: CollisionShape2D = $WhipArea/CollisionShape2D

var enemies_in_range: Array
var nearestEnemy

func _ready():
	await get_tree().create_timer(0.5).timeout
	
	hit()

func _process(delta):
	for enemy in enemies_in_range:
		if not nearestEnemy:
			nearestEnemy = enemy
		elif position.distance_to(enemy.global_position) < position.distance_to(nearestEnemy.global_position):
			nearestEnemy = enemy


func hit():
	if nearestEnemy != null:
		rotation = global_position.angle_to_point(nearestEnemy.global_position)
	
	visual.show()
	collision_shape.disabled = false;
	
	await get_tree().create_timer(0.5).timeout
	
	visual.hide()
	collision_shape.disabled = true;
	
	await get_tree().create_timer(2.0).timeout
	
	hit()

func _on_area_2d_body_entered(body):
	if body is Enemy:
		body.queue_free()

func _on_detection_area_body_entered(body):
	if body is Enemy:
		enemies_in_range.push_back(body)

func _on_detection_area_body_exited(body):
	if enemies_in_range.has(body):
		enemies_in_range.erase(body)
