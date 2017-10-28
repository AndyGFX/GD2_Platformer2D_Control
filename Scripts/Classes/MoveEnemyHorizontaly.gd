

var object
var speed = 0
var accel = 0
var movement = 1
var velocity = Vector2()
var isOnGround = true
var inCrunch = false
var inMotion = false
var inHurt = false
var jumping = false
var left = null
var right = null

# Movement Constants
const FLOOR_NORMAL = Vector2(0, -1)
const SLOPE_FRICTION = 20
const MIN_SPEED = 0.2

# -----------------------------------------------------------
# Horizontal movement constructor
# -----------------------------------------------------------
func _init(obj,castLeft,castRight,object_speed, object_acceleration=1):
	object = obj
	left = castLeft
	right = castRight
	speed = object_speed
	accel = object_acceleration

# -----------------------------------------------------------
# Apply movement to object
# -----------------------------------------------------------
func Apply(delta):
	
	if movement!=0:
		if (left.is_colliding() and !right.is_colliding()): 
			movement = -movement		
		if (!left.is_colliding() and right.is_colliding()): 
			movement = -movement		
		
	velocity.x = lerp(velocity.x, movement*speed, accel)
	velocity = object.move_and_slide(velocity,FLOOR_NORMAL,SLOPE_FRICTION)
	

# -----------------------------------------------------------
# Get last velocity vector
# -----------------------------------------------------------
func GetVelocity():
	return velocity
	
	
