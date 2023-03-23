class_name Interaction extends Area2D

@export var interactables: Array[Interactable]

func _ready():
	pass # Replace with function body.

func interact():
	if interactables.size() > 0:
		interactables[0].interact()

func _on_area_entered(area):
	if area is Interactable:
		interactables.push_back(area)

func _on_area_exited(area):
	if interactables.has(area):
		interactables.erase(area)
