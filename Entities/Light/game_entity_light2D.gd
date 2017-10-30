extends Light2D

var item_type = "light"

#------------------------------------------------
# Initialize on start
#------------------------------------------------
func _ready():
	if get_tree().is_editor_hint():
		get_node("Sprite").set_hidden(false)
	else:
		get_node("Sprite").set_hidden(true)