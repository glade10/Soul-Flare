@tool
class_name BSP extends Node
var pos: Vector2
var dim: Vector2
var c1: BSP
var c2: BSP

func _ready():
	pass
func setup(x: float, y: float, w: float, h: float) -> void:
	pos = Vector2(x,y)
	dim = Vector2(w,h)
	c1 = null
	c2 = null

func getLeaves():
	if !(c1 || c2):
		return [self]
	var a: Array = []
	a.append_array(c1.getLeaves())
	a.append_array(c2.getLeaves())
	return a

func branch():
	const MIN_SIZE := 0.01
	if dim.x < MIN_SIZE * 2.0 or dim.y < MIN_SIZE * 2.0:
		return
	var d: Array[float] = [dim.x, dim.y]
	var m: float = max(dim.x, dim.y)
	var n: int = d.find(m,0)
	var marg: float = 0.25
	if (n == 0):
		var rx: float = randf_range(marg * dim.x, (1-marg) * dim.x)
		c1 = BSP.new()
		c2 = BSP.new()
		c1.setup(pos.x, pos.y, rx, dim.y)
		c2.setup(pos.x + rx, pos.y, dim.x - rx, dim.y)
	elif (n == 1):
		var ry: float = randf_range(marg * dim.y, (1-marg) * dim.y)
		c1 = BSP.new()
		c2 = BSP.new()
		c1.setup(pos.x, pos.y, dim.x, ry)
		c2.setup(pos.x, pos.y + ry, dim.x, dim.y - ry)
func init(depth: int) -> void:
	branch()
	if(depth == 1):
		return
	else:
		c1.init(depth-1)
		c2.init(depth-1)
