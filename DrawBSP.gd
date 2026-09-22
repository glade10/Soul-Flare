@tool
extends Node2D
@export var x: float = 0
@export var y: float = 0
@export var w: float = 500
@export var h: float = 500
var bsp: BSP
@export var refresh: bool = false:
	set(val):
		refresh = false
		createBSP()
func createBSP() -> void:
	bsp = BSP.new()
	bsp.setup(0, 0, 1, 1)
	bsp.init(9)
func _ready() -> void:
	print("READY")
	set_process(true)

func _process(delta: float) -> void:
	queue_redraw()

func _draw() -> void:
	if bsp:
		var leaves: Array = bsp.getLeaves()
		for leaf in leaves:
			draw_rect(Rect2(leaf.pos * Vector2(w, h) + Vector2(x,y), leaf.dim * Vector2(w, h)), Color.GREEN, false)
