extends Area2D

export var callback = "<undefined>"
export var item_id = 0
export var key_name = "up_key"
export var set_state = true
export var switch_mode = "OnEnter"   # OnEnter / OnKey
export var target_name = "<undefined>"

var item_type = "switch"

#------------------------------------------------
# Initialize on start
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
	