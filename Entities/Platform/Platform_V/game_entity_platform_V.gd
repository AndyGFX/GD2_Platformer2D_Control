extends Area2D

var item_type = "platform_v"
var platform = null


export var item_id = 0
export var top_end_point = 0
export var bottom_end_point = 0
export var speed = 0
export var dir = 1

var _pos = null

func _ready():
	add_to_group("PLATFORM_V")
	platform = get_node(".")
	connect("area_enter", self, "_on_area_enter")
	connect("body_enter", self, "_on_body_enter")
	set_fixed_process(true)
	_pos = get_pos()
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

func _fixed_process(delta):

	translate(Vector2(0,-speed*delta * dir))

	var pos = get_pos()

	if (pos.y)<=(_pos.y-top_end_point) or (pos.y)>(_pos.y+bottom_end_point):
		dir=-dir
	pass