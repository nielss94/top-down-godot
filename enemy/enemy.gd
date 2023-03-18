extends CharacterBody2D
class_name Enemy

@onready var navigation_agent = $NavigationAgent2D
@export var sightRange = 20
var target: Player


var in_range: bool

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
	var move_direction = position.direction_to(next)
	velocity = move_direction * 50
	
	navigation_agent.set_velocity(velocity)
	
	move_and_slide()

func set_target(target: Player):
	self.target = target
	

func _on_area_2d_body_entered(body):
	if body.name == 'Player':
		set_target(body)
