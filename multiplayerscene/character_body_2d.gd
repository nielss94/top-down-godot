extends CharacterBody2D

const SPEED = 300.0

@export var player_id := 1:
	set(value):
		player_id = value
		$MultiplayerSynchronizer.set_multiplayer_authority(player_id)


func _physics_process(delta):
	velocity.x = $MultiplayerSynchronizer.direction * SPEED

	move_and_slide()
