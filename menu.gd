@tool
extends CenterContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var window = get_viewport_rect().size
	self.size.x = window.x
	visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_new_game() -> void:
	visible = false
