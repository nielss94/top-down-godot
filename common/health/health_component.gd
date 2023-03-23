class_name Health extends Node

signal health_changed(value)
signal health_zero

@export var currentHealth: int
@export var maxHealth: int


func lose(amount: int):
	currentHealth = clamp(currentHealth - amount, 0, maxHealth)
	health_changed.emit(currentHealth)
	if currentHealth == 0:
		health_zero.emit()
	
func gain(amount: int):
	currentHealth = clamp(currentHealth + amount, 0, maxHealth)
	health_changed.emit(currentHealth)	
	
