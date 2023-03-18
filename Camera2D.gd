extends Camera2D

@export var follow_speed = 3
var player : CharacterBody2D

func _ready():
	pass

func _process(delta):
	if player:
		position = lerp(position, player.position, follow_speed * delta)
