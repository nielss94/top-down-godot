class_name FloatingText extends Control

@onready var floating_text_label: Label = $FloatingTextLabel


func _ready():
	var tween = get_tree().create_tween().bind_node(self).set_trans(Tween.TRANS_QUAD)
	tween.tween_property(self, "position", position + Vector2.UP * 20, 1.0)
	
	tween.finished.connect(queue_free)

func set_text(text: String, color: Color) -> void:
	floating_text_label.text = text
	floating_text_label.add_theme_color_override("font_color", color)
