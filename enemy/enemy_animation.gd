extends Sprite2D


@onready var anim_tree = $"../AnimationTree"
@onready var character_body_2d : CharacterBody2D = $".."


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var is_moving = character_body_2d.direction != Vector2.ZERO
	anim_tree.set("parameters/conditions/IsMoving", is_moving)
	anim_tree.set("parameters/conditions/NotIsMoving", !is_moving)
	anim_tree.set("parameters/run/blend_position", character_body_2d.velocity.normalized())
