extends Area2D


export var new_jump_force = 300;
export var time_to_off = 10
export var item_id = 0

var item_type = "powerup_jump"


func _get_item_rect():
	return self.get_node("Sprite").get_item_rect()
	
func _ready():
	pass

# pickup key method which is called from area detector assigned on player
func PickupPowerUpJump():	
	queue_free()
