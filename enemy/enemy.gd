extends CharacterBody2D
class_name Enemy

@onready var navigation_agent = $NavigationAgent2D
@export var sightRange = 20
@export var speed = 20
var target: Player
var in_range: bool
@export var direction = Vector2.ZERO

func _ready():
	pass
	
func _process(delta):
	if not target:
		return
		
	in_range = position.distance_to(target.position) < sightRange

func _physics_process(delta):
	if not target:
		return
	
	if not in_range:
		return

	navigation_agent.set_target_position(target.position)
	
	var next = navigation_agent.get_next_path_position()
	direction = position.direction_to(next)
	velocity = direction * speed
	
	navigation_agent.set_velocity(velocity)
	
	move_and_slide()

func set_target(target: Player):
	self.target = target
	

func _on_area_2d_body_entered(body):
	if body is Player:
		set_target(body)
