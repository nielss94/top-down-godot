extends Sprite2D

@onready var anim_tree = $AnimationTree
@onready var player_character_body = $".."


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var is_moving = player_character_body.direction != Vector2.ZERO
	anim_tree.set("parameters/conditions/IsMoving", is_moving)
	anim_tree.set("parameters/conditions/NotIsMoving", !is_moving)
	
	if player_character_body.direction != Vector2.ZERO:
		flip_h = player_character_body.direction.x < 0