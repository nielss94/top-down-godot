extends Sprite2D

@onready var anim_tree = $"../AnimationTree"
@onready var player_character_body: CharacterBody2D = $".."
@onready var player: Player = $".."


func _ready():
	pass

func _process(delta):
	var is_moving = player_character_body.direction != Vector2.ZERO
	anim_tree.set("parameters/conditions/IsMoving", is_moving)
	anim_tree.set("parameters/conditions/NotIsMoving", !is_moving)
	anim_tree.set("parameters/run/blend_position", player_character_body.direction)
