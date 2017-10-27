var animPlayer = null
var animation_state = Global.eAnimState.IDLE
var current_animation = Global.eAnimState.IDLE
var _anim_name = ""

# -----------------------------------------------------------
# AnimationState class Contructor
# -----------------------------------------------------------
func _init(anim):
	animPlayer = anim

# -----------------------------------------------------------
# Check and return animation state from movement controller
# -----------------------------------------------------------
func GetState(moveControl):

	var inMove = moveControl.velocity.x!=0;

	# if is in move
	if inMove:
		# RIGHT 
		if moveControl.velocity.x > 0:
			# => set sprite orientation to RIGTH
			moveControl.object.scale(Vector2(1,1))
		if moveControl.velocity.x < 0:
			# => set sprite orientation to LEFT
			moveControl.object.scale(Vector2(-1,1))
	
	if moveControl.isOnGround:
		if moveControl.velocity.x!=0:
			if !moveControl.object.is_colliding():
				if moveControl.inCrunch:
					animation_state = Global.eAnimState.CRUNCHWALK
				else:
					animation_state = Global.eAnimState.WALK
		else:
			if moveControl.inCrunch:
				animation_state = Global.eAnimState.CRUNCH
			else:
				animation_state = Global.eAnimState.IDLE
	else:
		if moveControl.velocity.y>0:
			animation_state = Global.eAnimState.FALL
			
	if moveControl.jumping and moveControl.velocity.y<0: 
		animation_state = Global.eAnimState.JUMP
	
	return animation_state

# -----------------------------------------------------------
# Play animation by state
# before you need call Check method
# -----------------------------------------------------------
func Play(state):
	
	if state==Global.eAnimState.IDLE: _anim_name = "Idle"
	if state==Global.eAnimState.WALK: _anim_name = "Walk"
	if state==Global.eAnimState.JUMP: _anim_name = "Jump"
	if state==Global.eAnimState.FALL: _anim_name = "Fall"
	if state==Global.eAnimState.CRUNCH: _anim_name = "Crunch"
	if state==Global.eAnimState.CRUNCHWALK: _anim_name = "CrunchWalk"
	
	if current_animation != animation_state:
		animPlayer.play(_anim_name)
		current_animation = animation_state
	
	