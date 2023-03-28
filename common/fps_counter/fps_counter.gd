extends Label

func _process(delta):
	text = "%s FPS" % str(Engine.get_frames_per_second())
