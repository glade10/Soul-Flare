extends TextureButton
signal newGame

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(position, visible)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	newGame.emit()


func _on_mouse_entered() -> void:
	print("You're hovering over me!")
