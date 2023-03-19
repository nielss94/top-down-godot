extends CharacterBody2D
class_name Player

signal toggle_inventory
signal inventory_changed

@export var inventory: Inventory

@export var speed = 300.0
@export var direction = Vector2.ZERO

func _process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
	
	if Input.is_action_just_pressed("inventory"):
		toggle_inventory.emit()
		
	if Input.is_action_just_pressed("L"):
		var helmet = load("res://item/equipment/wooden_helmet.tres")
		inventory.add(helmet)
		inventory_changed.emit()

func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()
	

