extends Area2D

var item_type = "granade"
export var item_amount = 1
export var item_id = 0

func _get_item_rect():
	return self.get_node("Sprite").get_item_rect()
	
func _ready():
	pass

# pickup ammo item method which is called from area detector assigned on player
func PickupGranade():
	if !Inventory: return	
	Inventory.Add(item_type,item_amount)
	queue_free()
