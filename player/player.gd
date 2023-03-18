extends CharacterBody2D
class_name Player

@export var speed = 300.0
@export var direction = Vector2.ZERO

func _process(delta):
	direction = Input.get_vector("left", "right", "up", "down")

func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()
