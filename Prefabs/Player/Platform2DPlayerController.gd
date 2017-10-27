extends KinematicBody2D

# preload used classes
var cMove = preload("res://Scripts/Classes/MovePlatformer.gd")
var cInput = load("res://Scripts/Classes/InputManager.gd")
var cAnimState = preload("res://Scripts/Classes/AnimationState.gd")
var cShooting = preload("res://Scripts/Classes/Shooting.gd")

# exports to inspector
export var playerMaxSpeed = 200
export var acceleration = 0.2
export var jumpForce = 200
export var jumpTreshold = 0.2

# clear instances

var key_left = null
var key_right= null
var key_jump= null
var key_crunch= null
var key_fire = null

var player = null
var move = null
var anim = null
var fire = null

var teleport_info = null
var msg_info = null
var container = null;

# signal for update viewport
signal moveSignal

# resize gizmo to player sprite size ()
func _get_item_rect():
    return get_node("PlayerAnimation/Sprite").get_item_rect()

# ---------------------------------------------------------
# INITIALIZE ON START
# ---------------------------------------------------------
func _ready():

	# find container instance in scene
	container =  Utils.find_node("Container")

	# create container instance in scene if missing
	if !container:
		container = Node2D.new();
		container.set_name("Container")
		get_parent().call_deferred("add_child",container)


	# preload Inventory data
	Inventory.Load();

	#create input control
	key_left = cInput.new("key_left"); container.add_child(key_left)
	key_right = cInput.new("key_right"); container.add_child(key_right)
	key_jump = cInput.new("key_jump"); container.add_child(key_jump)
	key_fire = cInput.new("key_fire"); container.add_child(key_fire)
	key_crunch = cInput.new("key_down"); container.add_child(key_crunch)

	# get player object

	player = get_node(".")

	# create platformer2D move controller

	move = cMove.new(player, key_left, key_right, key_jump, key_crunch, playerMaxSpeed, acceleration, jumpForce, jumpTreshold)

	# create AnimationState class

	anim = cAnimState.new(get_node("PlayerAnimation/AnimationPlayer"))

	# create shooting instance and bullet container

	var fire_pivot = get_node("FireOrigin_RIGHT")
	fire = cShooting.new(move, key_fire,Global.bullet_prefab,container,fire_pivot,false)

	#disable rapid fire

	fire.RapidFire(false)

	# create teleport button info instance
	teleport_info = Global.teleport_button_info.instance()
	teleport_info.set_global_pos(Vector2(0,-5000));
	container.add_child(teleport_info)

	# create message info panel instance
	msg_info = Global.msg_info_panel.instance()
	msg_info.set_global_pos(Vector2(0,-5000))
	container.add_child(msg_info)

	# enable update per frame
	set_fixed_process(true)

	# prepare inventory/gamedata to default values
	Inventory.Set('coins',0);
	Inventory.Set('health',100);
	Inventory.Set('ammo',100);
	Inventory.Set('KEY_A',false);
	Inventory.Set('KEY_B',false);
	Inventory.Set('KEY_C',false);
	Inventory.Set('KEY_D',false);
	Inventory.Save()

	# get sound fx library for player
	Global.player_sfx = Utils.find_node("PlayerSoundFX")

	# respawn play at 'start_point'
	Respawn()

	pass


# -----------------------------------------------------------
# Respawn player position on level start if exist entity GAME_PlayerStart in scene
# -----------------------------------------------------------
func Respawn():
	var spawn_point = Utils.find_node("PlayerStart")
	if spawn_point:
		spawn_point.Respawn(self)

# ---------------------------------------------------------
# FIXED UPDATE LOOP
# ---------------------------------------------------------
func _fixed_process(delta):

	# realize platformer movement
	move.Apply(delta)

	# get animation state and store result to global variable for easy access from any code
	var playerAnimState = anim.GetState(move)

	# play animation
	anim.Play(playerAnimState)

	# check shooting
	fire.Check()

	# update viewport position
	if move.inMotion: emit_signal("moveSignal")


func _exit_tree():
	Inventory.Save();

# ---------------------------------------------------------
# ON ENTER TRIGGER callback for scene entities
# ---------------------------------------------------------
func _on_TriggerDetector_area_enter( area ):

	# | pickup COIN
	# -----------------------------------------------------
	if area.has_method('PickupCoin'): area.PickupCoin()

	# | pickup AMMO
	# -----------------------------------------------------
	if area.has_method('PickupAmmo'): area.PickupAmmo()

	# | pickup KEY
	# -----------------------------------------------------
	if area.has_method('PickupKey'): area.PickupKey()

	# | pickup HEALTH
	# -----------------------------------------------------
	if area.has_method('PickupHealth'): area.PickupHealth()


	# | show message info on enter trigger zone
	# -----------------------------------------------------
	if area.has_method('EnterToMsgZone'):
		msg_info.set_global_pos(area.get_global_pos()+area.panel_offset)
		msg_info.Show(area.info_text)
		area.EnterToMsgZone()

	# | teleport to target door when player press 'key_up'
	# -----------------------------------------------------
	if area.has_method('Teleport'):
		teleport_info.set_global_pos(area.get_global_pos())
		teleport_info.Show()
		area.Teleport(player)

	# | Pickup timelimited jump force
	# -----------------------------------------------------
	if area.has_method('PickupPowerUpJump'):

		# setup powerup
		var jump = Global.powerup_jump.instance()
		jump.Start(move,container,area.time_to_off,area.new_jump_force)

		# remove powerup
		area.PickupPowerUpJump()

	# | Pickup timelimited speed
	# -----------------------------------------------------
	if area.has_method('PickupPowerUpSpeed'):

		# setup powerup
		var speed = Global.powerup_speed.instance()
		speed.Start(move,container,area.time_to_off,area.new_speed)

		# remove powerup
		area.PickupPowerUpSpeed()

	# | Pickup timelimited gravity
	# -----------------------------------------------------
	if area.has_method('PickupPowerUpGravity'):

		# setup powerup
		var grav = Global.powerup_gravity.instance()
		grav.Start(move,container,area.time_to_off,area.new_gravity)

		# remove powerup
		area.PickupPowerUpGravity()

# ---------------------------------------------------------
# ON EXIT TRIGGER callback for scene entities
# ---------------------------------------------------------
func _on_TriggerDetector_area_exit( area ):

	# reset teleport to target when player exit from area and key wasn't pressed
	if area.has_method('ResetTeleport'):
		teleport_info.Hide()
		area.ResetTeleport()

	# show message info on enter trigger zone
	if area.has_method('ExitFromMsgZone'):
		msg_info.Hide()
