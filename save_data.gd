class_name savedata
extends Node
var bsp: BSP
var file
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
func new_game(save):
	if !FileAccess.file_exists("user://soulflare%s.save" % save):
		var SaveFile = FileAccess.open("user://soulflare%s.save" % save,FileAccess.WRITE)
		SaveFile.close()
func save_game(save):
	var saveFile = FileAccess.open("user://soulflare%s.save" % save, FileAccess.WRITE)
	if !saveFile:
		print("Failed to open save file %s" % save)
		return
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		if node.scene_file_path.is_empty():
			print("Persistent node '%s' is not an instanced scene; skipped " % node.name)
			continue
		if !node.has_method("save"):
			print("Persistent node %s can't be saved" % node.name)
			continue
		var nodeData = node.call("save")
		var jsonString = JSON.stringify(nodeData)
		saveFile.store_line(jsonString)
	saveFile.close()


func _on_quit_pressed() -> void:
	pass # Replace with function body.


func _on_new_game() -> void:
	pass # Replace with function body.
