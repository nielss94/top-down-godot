class_name Whip extends Node2D

signal hit_enemy(whip: Whip, enemy: Enemy)

@onready var visual: Sprite2D = $Sprite2D
@onready var collision_shape: CollisionShape2D = $WhipArea/CollisionShape2D

var enemies_in_range: Array
var nearestEnemy

@export var attack_orientation: StatOrientation.Type
@export var crit_orientation: StatOrientation.Type

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
	
	await get_tree().create_timer(0.3).timeout
	
	visual.hide()
	collision_shape.disabled = true;
	
	await get_tree().create_timer(.4).timeout
	
	hit()

func _on_area_2d_body_entered(body):
	if body is Enemy:
		hit_enemy.emit(self, body as Enemy)

func _on_detection_area_body_entered(body):
	if body is Enemy:
		enemies_in_range.push_back(body)

func _on_detection_area_body_exited(body):
	if enemies_in_range.has(body):
		enemies_in_range.erase(body)
