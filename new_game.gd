@tool
extends TextureButton
signal newGame

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(position, visible)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	$AnimatedSprite2D.speed_scale = 8
	$AnimatedSprite2D.play()
	$AnimatedSprite2D.animation_looped.connect(_on_animation_finished)


func _on_animation_finished() -> void:
	$AnimatedSprite2D.stop()
	await Fade.fade_out().finished
	newGame.emit()
	await Fade.fade_in().finished
