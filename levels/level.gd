extends Node2D

@onready var camera = $Camera2D
@onready var player = $Player

func _ready():
	camera.player = player
