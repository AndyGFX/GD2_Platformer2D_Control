extends Area2D

var item_id = 0
var item_type = "start_point"
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
func EnterToStartPoint():
	# additional code here
	pass

#------------------------------------------------
# Exit from zone
#------------------------------------------------
func ExitFromStartPoint():
	# additional code here
	pass
	
#------------------------------------------------
# Exit from zone
#------------------------------------------------
func Respawn(player):
	# additional code here
	player.set_global_pos(self.get_global_pos())
	pass	
	