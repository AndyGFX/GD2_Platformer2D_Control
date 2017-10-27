extends Area2D

export var info_text = "<undefined>"
export var panel_offset = Vector2(0,0)

var item_type = "info_text"

#------------------------------------------------
# Enter to zone
#------------------------------------------------
func _ready():
	if get_tree().is_editor_hint():
		get_node("Sprite").set_hidden(false)
	else:
		get_node("Sprite").set_hidden(true)

#------------------------------------------------
# Enter to zone
#------------------------------------------------
func EnterToMsgZone():
	# additional code here
	pass

#------------------------------------------------
# Exit from zone
#------------------------------------------------
func ExitFromMsgZone():
	# additional code here
	pass
	