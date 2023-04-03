extends Node

const character_scene = preload("res://multiplayerscene/character_body_2d.tscn")

@onready var multiplayer_root = $Node


func _on_join_pressed():
	var peer = ENetMultiplayerPeer.new()
	peer.create_client("127.0.0.1", 1337)
	multiplayer.multiplayer_peer = peer

func _on_create_pressed():
	var peer = ENetMultiplayerPeer.new()
	multiplayer.peer_connected.connect(spawn_player)
	peer.create_server(1337)
	multiplayer.multiplayer_peer = peer
	spawn_player(multiplayer.get_unique_id())

func spawn_player(id):
	var new_player = character_scene.instantiate()
	
	new_player.name = str(id)
	new_player.player_id = id

	multiplayer_root.add_child(new_player)

