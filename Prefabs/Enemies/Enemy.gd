extends KinematicBody2D

const scn_explosion = [ 
	preload("res://Prefabs/Explosion/explosion_0.tscn"),
	preload("res://Prefabs/Explosion/explosion_1.tscn"),
	preload("res://Prefabs/Explosion/explosion_2.tscn")
	]

var cMove = preload("res://Scripts/Classes/MoveEnemyHorizontaly.gd")
var cAnim = preload("res://Scripts/Classes/AnimationState.gd")

var enemy = null;
var rayLeft = null;
var rayRight = null;

var move =null;
var anim =null;

export var enemyMaxSpeed = 10
export var acceleration = 0.2
export var health = 100

# ---------------------------------------------------------
# Initialize on start
# ---------------------------------------------------------
func _ready():

	enemy = get_node(".")

	set_fixed_process(true)
	rayLeft = get_node("CastLeft");
	rayRight = get_node("CastRight");
	move = cMove.new(enemy,rayLeft,rayRight,enemyMaxSpeed)
	anim = cAnim.new(get_node("Animation/AnimationPlayer"))

# ---------------------------------------------------------
# On Fixed Update
# ---------------------------------------------------------
func _fixed_process(delta):

	# realize movement
	self.move.Apply(delta)

	# get animation state and store result
	var playerAnimState = anim.GetState(move)

	# play animation
	anim.Play(playerAnimState)

# ---------------------------------------------------------
# Create collision
# ---------------------------------------------------------
func create_explosion():
	
	var idx = int(round(rand_range(0,2)))	
	var explosion = scn_explosion[idx].instance()
	explosion.set_pos(get_pos())
	Utils.main_node.add_child(explosion)
	pass

# ---------------------------------------------------------
# On bullet hit decrease enemy health and create explosion
# ---------------------------------------------------------
func _on_Bullet_body_enter( body ):
	
	if (body.get_name()=="Bullet"):		
		create_explosion()
		self.health -= body.bulletDamage
		body.free()
		if self.health<0:
			queue_free()
