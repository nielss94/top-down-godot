extends Node2D

@export var sprite: Sprite2D
@export var character_body: CharacterBody2D

func _ready():
	pass

func _process(delta):
	if character_body.direction != Vector2.ZERO:
		sprite.flip_h = character_body.direction.x < 0
