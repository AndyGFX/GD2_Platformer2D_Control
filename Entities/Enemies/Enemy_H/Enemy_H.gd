extends Area2D

const scn_explosion = [
	preload("res://Prefabs/Explosion/explosion_0.tscn"),
	preload("res://Prefabs/Explosion/explosion_1.tscn"),
	preload("res://Prefabs/Explosion/explosion_2.tscn")
	]

var enemy = null;
var rayLeft = null;
var rayRight = null;
var animPlayer = null;
var current_animation = ""

export var armor = 100
export var damage = 10
export var speed = 25
export var velocity = Vector2(0,0)

# ---------------------------------------------------------
# Initialize on start
# ---------------------------------------------------------
func _ready():

	enemy = get_node(".")
	set_fixed_process(true)
	rayLeft = get_node("CastLeft");
	rayRight = get_node("CastRight");
	animPlayer = get_node("Enemy/AnimationPlayer");
	add_to_group("ENEMY")
	connect("area_enter", self, "_on_area_enter")
	connect("body_enter", self, "_on_body_enter")
	Start()
	
func set_armor(new_value):

	if is_queued_for_deletion(): return

	armor -= new_value
	
	if armor <= 0:
		create_explosion()
		queue_free()
	pass

# ---------------------------------------------------------
# On AREA hit
# ---------------------------------------------------------
func _on_area_enter(other):
	if other.is_in_group("PLAYER"):
		other.Damage(damage,velocity)
		queue_free()
	
# ---------------------------------------------------------
# On BODY hit
# ---------------------------------------------------------
func _on_body_enter(body):
	if body.is_in_group("PLAYER"):
		body.Damage(10,velocity)
	
# ---------------------------------------------------------
# On Fixed Update
# ---------------------------------------------------------
func _fixed_process(delta):

	if velocity.x!=0:
		#switch move to left
		if (rayLeft.is_colliding() and !rayRight.is_colliding()):
			velocity.x = -velocity.x
			self.scale(Vector2(-1,1))
			
		#switch move to right
		if (!rayLeft.is_colliding() and rayRight.is_colliding()):
			velocity.x = -velocity.x
			self.scale(Vector2(1,1))

	translate(velocity * delta)
	
	pass

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
# Play animation byname
# ---------------------------------------------------------
func PlayAnimation(anim_name):		
		if current_animation != anim_name:
			animPlayer.play(anim_name)
			current_animation = anim_name
			

# ---------------------------------------------------------
# Start enemy movement
# ---------------------------------------------------------
func Start():
	velocity.x = speed
	PlayAnimation("Walk")
	
# ---------------------------------------------------------
# Stop enemy movement
# ---------------------------------------------------------
func Stop():
	velocity.x = 0	
	PlayAnimation("Idle")