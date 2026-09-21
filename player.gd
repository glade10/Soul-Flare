extends Area2D

signal hit

@export var speed = 200;
var screen_size;
var health = 100;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size;
	visible = false
	set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if velocity.length_squared() == 0:
		$AnimatedSprite2D.animation = "Idle"
	else:
		$AnimatedSprite2D.animation = "WalkFowards"
		velocity = velocity.normalized() * speed
	$AnimatedSprite2D.play()
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
func save():
	return {
		"pos": position,
		"health": health
	}
