extends MultiplayerSynchronizer

@export var direction: float

# Called when the node enters the scene tree for the first time.
func _ready():
	print("authority for %s with %s is %s" % [ get_multiplayer_authority(), multiplayer.get_unique_id() ,get_multiplayer_authority() == multiplayer.get_unique_id()])
	set_process(get_multiplayer_authority() == multiplayer.get_unique_id())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	direction = Input.get_axis("left", "right")
