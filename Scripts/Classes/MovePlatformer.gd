# -----------------------------------------------------------
# internal variables
# -----------------------------------------------------------
var object
var key_1
var key_2
var key_3
var key_4
var speed = 0
var accel = 0
var movement = 0
var velocity = Vector2()
var facing = Global.eFacing.TO_RIGHT

# -----------------------------------------------------------
# Jumping properties
# -----------------------------------------------------------
var world_gravity = Vector2(0,1000)
var jumpForce = 400
var jumpTreshold = 0.2
var isOnGround = false
var inMotion = false
var inCrunch = false
var jumping = false


# -----------------------------------------------------------
# Private variables
# -----------------------------------------------------------
var _jump_timer = 0
var _is_enabled = true
var _stored_jump_force = 0
var _stored_speed = 0
var _stored_gravity = Vector2(0,1000)
var _shape_walk = null
var _shape_crunch = null

# -----------------------------------------------------------
# Movement constants
# -----------------------------------------------------------
const FLOOR_NORMAL = Vector2(0, -1)
const SLOPE_FRICTION = 20
const MIN_SPEED = 0.2

# -----------------------------------------------------------
# Platformer2D move constructor
# -----------------------------------------------------------
func _init(obj,mKeyLeft,mKeyRight,mKeyJump,mKeyCrunch,object_speed, object_acceleration,obj_jump_force,obj_jump_treshold):
	object = obj
	key_1 = mKeyLeft
	key_2 = mKeyRight
	key_3 = mKeyJump
	key_4 = mKeyCrunch
	speed = object_speed
	accel = object_acceleration
	jumpForce = obj_jump_force
	jumpTreshold = obj_jump_treshold

	# store movement properties for Restore methods
	_stored_gravity = world_gravity
	_stored_jump_force = jumpForce
	_stored_speed = speed

	# prepare collision shapes
	_shape_walk = obj.get_node("PlayerShapeWalk")
	_shape_walk.set_trigger(false)
	_shape_crunch = obj.get_node("PlayerShapeCrunch")
	_shape_crunch.set_trigger(true)

# -----------------------------------------------------------
# Apply movement to object
# -----------------------------------------------------------
func Apply(delta):

	velocity += world_gravity * delta
	_jump_timer += delta
	movement = 0
	inMotion = false

	# key check for move LEFT
	if key_1.IsHold():
		movement = -1
		facing = Global.eFacing.TO_LEFT
		
	# key check for move RIGHT
	if key_2.IsHold():
		movement = 1
		facing = Global.eFacing.TO_RIGHT
		
	# key check for toggle CRUNCH
	if key_4.IsPressed():
		inCrunch = !inCrunch;
		if inCrunch:
			_shape_walk.set_trigger(true)
			_shape_crunch.set_trigger(false)
		else:
			_shape_walk.set_trigger(false)
			_shape_crunch.set_trigger(true)
	
#	# key check for CRUNCH end
#	if key_4.IsReleased():
#		inCrunch = false;
#		_shape_walk.set_trigger(false)
#		_shape_crunch.set_trigger(true)

	movement*=speed

	velocity.x = lerp(velocity.x, movement, accel)

	velocity = object.move_and_slide(velocity,FLOOR_NORMAL,SLOPE_FRICTION)
	isOnGround = object.is_move_and_slide_on_floor()

	if(isOnGround): _jump_timer = 0

	# is jump enabled by treshold time ?
	_is_enabled = _jump_timer < jumpTreshold

	# Apply jump force on key pressed when is enabled
	if key_3.IsPressed() and _is_enabled:
		jumping = true
		velocity.y -= jumpForce
		_jump_timer = jumpTreshold

	if velocity.y > 0:
		jumping = false

	if velocity.y!=0 or velocity.x != 0: inMotion = true;

# -----------------------------------------------------------
# Get last velocity vector
# -----------------------------------------------------------
func GetVelocity():
	return self.velocity

# -----------------------------------------------------------
# Set world gravity vector
# -----------------------------------------------------------
func SetGravity(new_gravity_vector):
	self.world_gravity = new_gravity_vector

# -----------------------------------------------------------
# Set world gravity vector
# -----------------------------------------------------------
func RestoreGravity():
	self.world_gravity = _stored_gravity

# -----------------------------------------------------------
# Set force jump
# -----------------------------------------------------------
func SetJumpForce(new_jump_force):
	self.jumpForce = new_jump_force

# -----------------------------------------------------------
# Restore jump force
# -----------------------------------------------------------
func RestoreJumpForce():
	self.jumpForce = _stored_jump_force

# -----------------------------------------------------------
# Set speed
# -----------------------------------------------------------
func SetSpeed(new_speed):
	self.speed = new_speed

# -----------------------------------------------------------
# Restore speed
# -----------------------------------------------------------
func RestoreSpeed():
	self.speed = _stored_speed