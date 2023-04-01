class_name FloatingTextManager extends Node

const floating_text = preload("res://floating_text/floating_text.tscn")

@export var damage_color: Color
@export var damage_crit_color: Color

func _ready():
	Events.enemy_took_damage.connect(enemy_took_damage)
	
func enemy_took_damage(amount: int, critical: bool, position: Vector2):
	var new_floating_text = floating_text.instantiate() as FloatingText
	
	new_floating_text.global_position = position
	
	add_child(new_floating_text)
	new_floating_text.set_text(str(amount), damage_crit_color if critical else damage_color)
