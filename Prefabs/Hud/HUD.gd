extends Container

onready var lblCoins = get_node("Label - coins");
onready var lblAmmo = get_node("Label - ammo");
onready var lblGranade = get_node("Label - granade");
onready var lblHealth = get_node("Label - health");


func _ready():

	set_process(true)
	
	
func _process(delta):
	
	lblCoins.set_text("Coins: "+str(Inventory.items.coins))	
	lblAmmo.set_text("Ammo: "+str(Inventory.items.ammo))	
	lblHealth.set_text("Health: "+str(Inventory.items.health))	
	lblGranade.set_text("Granade: "+str(Inventory.items.granade))	
	
	
