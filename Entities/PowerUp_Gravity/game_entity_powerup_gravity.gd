extends Area2D


export var new_gravity = Vector2(0,1000);
export var time_to_off = 10
export  var item_id = 0

var item_type = "powerup_gravity"


func _get_item_rect():
	return self.get_node("Sprite").get_item_rect()
	
func _ready():
	pass

# pickup key method which is called from area detector assigned on player
func PickupPowerUpGravity():	
	queue_free()
