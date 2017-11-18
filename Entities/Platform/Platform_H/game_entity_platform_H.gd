extends Area2D

var item_type = "platform_h"
var platform = null


export var item_id = 0
export var left_end_point = 0
export var right_end_point = 0
export var speed = 0

func _ready():
	add_to_group("SOLID")
	platform = get_node(".")
	connect("area_enter", self, "_on_area_enter")
	connect("body_enter", self, "_on_body_enter")
	pass

#------------------------------------------------
# Enter to zone
#------------------------------------------------
func EnterToPlatform():
	# additional code here
	pass

#------------------------------------------------
# Exit from zone
#------------------------------------------------
func ExitFromPlatform():
	# additional code here
	pass
	
# ---------------------------------------------------------
# On AREA hit
# ---------------------------------------------------------
func _on_area_enter(other):
	pass
	
# ---------------------------------------------------------
# On BODY hit
# ---------------------------------------------------------
func _on_body_enter(body):
	pass	