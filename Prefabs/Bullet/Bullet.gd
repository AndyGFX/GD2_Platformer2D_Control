extends KinematicBody2D

const scn_explosion = [ 
	preload("res://Prefabs/Explosion/explosion_0.tscn"),
	preload("res://Prefabs/Explosion/explosion_1.tscn"),
	preload("res://Prefabs/Explosion/explosion_2.tscn")
	]

export var bulletSpeed = 200
export var bulletFireSFX = "Shoot1"



var velocity = Vector2()

func _ready():	
	set_fixed_process(true)	
	Global.player_sfx.player.play(self.bulletFireSFX)
	randomize()
	
func SetFireDirection(dir):
	velocity.x = bulletSpeed * dir
	velocity.y = 0
	
func _fixed_process(delta):
	move(velocity*delta)
	if get_global_pos().x>1204:
		queue_free()
		
	if is_colliding():
		create_explosion()
		queue_free()

func create_explosion():
	
	var idx = int(round(rand_range(0,2)))	
	var explosion = scn_explosion[idx].instance()
	explosion.set_pos(get_pos())
	Utils.main_node.add_child(explosion)
	pass