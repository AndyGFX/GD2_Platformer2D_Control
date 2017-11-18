extends Area2D


var enemy = null;
var animPlayer = null;
var current_animation = ""
var item_typ = "enemy"


export var armor = 100
export var damage = 10
export var speed = 25
export var velocity = Vector2(0,0)
export var top_end_point = 0;
export var bottom_end_point = 0;

# ---------------------------------------------------------
# Initialize on start
# ---------------------------------------------------------
func _ready():

	enemy = get_node(".")
	set_fixed_process(true)
	add_to_group("ENEMY")
	connect("area_enter", self, "_on_area_enter")
	connect("body_enter", self, "_on_body_enter")
	
	
func set_armor(new_value):

	if is_queued_for_deletion(): return

	armor -= new_value
	
	if armor <= 0:
		create_explosion()
		queue_free()
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

# ---------------------------------------------------------
# Create collision
# ---------------------------------------------------------
func create_explosion():
	pass
	