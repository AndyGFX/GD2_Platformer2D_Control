var object
var key_1
var key_2
var speed = 0
var accel = 0
var movement = 0
var velocity = Vector2()

# Movement Constants
const FLOOR_NORMAL = Vector2(0, -1)
const SLOPE_FRICTION = 20
const MIN_SPEED = 0.2

# -----------------------------------------------------------
# Horizontal movement constructor
# -----------------------------------------------------------
func _init(obj,mKeyLeft,mKeyRight,object_speed, object_acceleration):
	object = obj
	key_1 = mKeyLeft
	key_2 = mKeyRight
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
	velocity.x = lerp(velocity.x, movement, accel)
	
	velocity = object.move_and_slide(velocity,FLOOR_NORMAL,SLOPE_FRICTION) 
	
# -----------------------------------------------------------
# Get last velocity vector
# -----------------------------------------------------------
func GetVelocity():
	return velocity
	
	