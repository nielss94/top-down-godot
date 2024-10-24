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
	
	var text = str(amount)
	var color = damage_color
	var scale = Vector2(1, 1)
	
	if critical:
		text = "CRIT " + text + "!"
		color = damage_crit_color
		scale = Vector2(1.5, 1.5)
	
	new_floating_text.set_text(text, color)
	new_floating_text.scale = scale
	
	if critical:
		new_floating_text.rotation_degrees = randf_range(-15, 15)
		var tween = create_tween()
		tween.tween_property(new_floating_text, "scale", Vector2(2, 2), 0.2)
		tween.tween_property(new_floating_text, "scale", scale, 0.1)
