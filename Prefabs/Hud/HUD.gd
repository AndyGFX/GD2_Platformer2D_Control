extends Container

onready var lblCoins = get_node("Label - coins");
onready var lblAmmo = get_node("Label - ammo");
onready var lblGranade = get_node("Label - granade");
onready var lblHealth = get_node("Label - health");

onready var iconPUSpeed = get_node("HUD -PowerUps/HUD - PowerUp - Speed/Icon")
onready var iconPUJump = get_node("HUD -PowerUps/HUD - PowerUp - Jump/Icon")
onready var iconPUGravity = get_node("HUD -PowerUps/HUD - PowerUp - Gravity/Icon")

func _ready():

	set_process(true)
	
	
func _process(delta):
	
	lblCoins.set_text("Coins: "+str(Inventory.items.coins))	
	lblAmmo.set_text("Ammo: "+str(Inventory.items.ammo))	
	lblHealth.set_text("Health: "+str(Inventory.items.health))	
	lblGranade.set_text("Granade: "+str(Inventory.items.granade))	
	
	
	if Inventory.items.powerup_gravity == 1:
		iconPUGravity.set_modulate(Color(1,1,1,1))
	else:
		iconPUGravity.set_modulate(Color(0,0,0,1))
		
	if Inventory.items.powerup_speed == 1:
		iconPUSpeed.set_modulate(Color(1,1,1,1))
	else:
		iconPUSpeed.set_modulate(Color(0,0,0,1))
		
	if Inventory.items.powerup_jump == 1:
		iconPUJump.set_modulate(Color(1,1,1,1))
	else:
		iconPUJump.set_modulate(Color(0,0,0,1))
	
	
