extends Area2D

var item_typ = "hazard"
var enemy = null;

export var damage = 10

func _ready():
	enemy = get_node(".")
	set_fixed_process(true)
	add_to_group("ENEMY")
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
	
# ---------------------------------------------------------
# On Fixed Update
# ---------------------------------------------------------
func _fixed_process(delta):
	pass
