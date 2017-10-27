extends Area2D


export var key_name = "key"
export var item_id = 0
var item_type = "key"

func _get_item_rect():
	return self.get_node("Sprite").get_item_rect()
	
func _ready():
	pass

# pickup key method which is called from area detector assigned on player
func PickupKey():
	if !has_node("/root/Inventory"): return
	get_node("/root/Inventory").Set(key_name,true)
	queue_free()
