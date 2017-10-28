extends KinematicBody2D

const scn_explosion = [ 
	preload("res://Prefabs/Explosion/explosion_0.tscn"),
	preload("res://Prefabs/Explosion/explosion_1.tscn"),
	preload("res://Prefabs/Explosion/explosion_2.tscn")
	]

export var bulletDamage = 25
export var bulletSpeed = 200
export var bulletFireSFX = "Shoot1"



var velocity = Vector2()

# ---------------------------------------------------------
# Initialize on start
# ---------------------------------------------------------
func _ready():	
	set_fixed_process(true)	
	Global.player_sfx.player.play(self.bulletFireSFX)
	randomize()

# ---------------------------------------------------------
# Set fire direction
# ---------------------------------------------------------
func SetFireDirection(dir):
	velocity.x = bulletSpeed * dir
	velocity.y = 0
	
# ---------------------------------------------------------
# On Update
# ---------------------------------------------------------	
func _fixed_process(delta):
	move(velocity*delta)
	if get_global_pos().x>1204:
		queue_free()
		
	if is_colliding():
		create_explosion()
		queue_free()

# ---------------------------------------------------------
# Create explosion on hit collision
# ---------------------------------------------------------
func create_explosion():
	
	var idx = int(round(rand_range(0,2)))	
	var explosion = scn_explosion[idx].instance()
	explosion.set_pos(get_pos())
	Utils.main_node.add_child(explosion)
	pass