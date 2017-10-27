# -----------------------------------------------------------
# Internal variables
# -----------------------------------------------------------
var object
var key_1
var key_2
var speed = 0
var accel = 0
var movement = 0
var velocity = Vector2()

# -----------------------------------------------------------
# Movement Constants
# -----------------------------------------------------------
const FLOOR_NORMAL = Vector2(0, -1)
const SLOPE_FRICTION = 20

# -----------------------------------------------------------
# Vetical movement constructor
# -----------------------------------------------------------
func _init(obj,mKeyUp,mKeyDown,object_speed, object_acceleration):
	object = obj
	key_1 = mKeyUp
	key_2 = mKeyDown
	speed = object_speed
	accel = object_acceleration

# -----------------------------------------------------------
# Apply movement to object
# -----------------------------------------------------------
func Apply(delta):
	
	movement = 0;
	
	if key_1.Pressed(): movement = -1
	if key_2.Pressed(): movement = 1
	
	movement*=speed
	velocity.y = lerp(velocity.y, movement, accel)
	
	velocity = object.move_and_slide(velocity,Vector2(0, -1),20) 

# -----------------------------------------------------------
# Get last calculated velocity vector
# -----------------------------------------------------------
func GetVelocity():
	return velocity	
	