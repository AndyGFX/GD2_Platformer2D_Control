extends Area2D


export var target_name = "<undefiend>"
export var key_name = "<undefiend>"
export var on_key = "<undefiend>"
export var need_key = false
export var teleport_type = 0

var eventOwner = null
var item_type = "teleport"

#------------------------------------------------
# 
#------------------------------------------------
func _ready():
	pass
	
#------------------------------------------------
# teleport to target area when key_use is pressed on player
#------------------------------------------------
func Teleport(player):
	if need_key: set_process(true)
	if !need_key and Inventory.HasItem(need_key,true): set_process(true)
	eventOwner = player
	pass

#------------------------------------------------
# reset prepared teleportation
#------------------------------------------------
func ResetTeleport():
	set_process(false)

func _process(delta):

	if Input.is_action_pressed(on_key):
		set_process(false)
		var target_node = Utils.find_node(target_name)
		var target_pos = target_node.get_node("SpawnPosition")
		var pos = target_pos.get_global_pos()
		eventOwner.set_pos(pos)
	pass
