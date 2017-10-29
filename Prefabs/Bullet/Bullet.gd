extends Area2D

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
	add_to_group("BULLET")
	connect("area_enter", self, "_on_area_enter")
	connect("body_enter", self, "_on_body_enter")
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
	translate(velocity*delta)


# ---------------------------------------------------------
# Create explosion on hit collision
# ---------------------------------------------------------
func create_explosion():

	var idx = int(round(rand_range(0,2)))
	var explosion = scn_explosion[idx].instance()
	explosion.set_pos(get_pos())
	Utils.main_node.add_child(explosion)
	pass

# ---------------------------------------------------------
# Check area hit
# ---------------------------------------------------------
func _on_area_enter(other):
	if other.is_in_group("ENEMY"):
		other.set_armor(bulletDamage)
		create_explosion()
		queue_free()
	pass

# ---------------------------------------------------------
# Check Body hit
# ---------------------------------------------------------
func _on_body_enter(other):		
	if other.is_in_group("SOLID"):
		create_explosion()
		queue_free()
	pass