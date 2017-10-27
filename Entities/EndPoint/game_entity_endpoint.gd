extends Area2D

export var next_scene = ""
var item_id = 0
var item_type = "end_point"
#------------------------------------------------
# Hide icon on start
#------------------------------------------------
func _ready():
	if get_tree().is_editor_hint():
		get_node("Sprite").set_hidden(false)
	else:
		get_node("Sprite").set_hidden(true)

#------------------------------------------------
# Enter to zone
#------------------------------------------------
func EnterToEndPoint():
	# additional code here
	pass

#------------------------------------------------
# Exit from zone
#------------------------------------------------
func ExitFromEndPoint():
	# additional code here
	pass
	