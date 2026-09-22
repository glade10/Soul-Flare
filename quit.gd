extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	print("Button exists!")
	print("Position: ", position)
	print("Size: ", size)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	print("quit")
	get_tree().quit()
