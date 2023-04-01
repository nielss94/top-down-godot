class_name Burger extends Sprite2D

@export var heal_amount: int = 10

func _on_area_2d_body_entered(body):
	if body is Player:
		(body as Player).heal(heal_amount)
		queue_free()
