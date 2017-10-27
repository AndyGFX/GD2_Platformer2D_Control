extends Node2D

onready var screen_size = Vector2(Globals.get("display/width"), Globals.get("display/height"))
onready var player = get_node("Player")
onready var HUD = get_node("HUD")

# user properties
export var smoothFollow = true
export var smoothSpeed = 0.1
export var useCamera = false

# internal fields
var old_pos
var new_pos
var canvas_transform
var cam = null;

# ---------------------------------------------------------------------------------
# Initialize on start
# ---------------------------------------------------------------------------------
func _ready():

	# create camera when is used instead viewport
	if self.useCamera:

		cam = Camera2D.new()
		player.add_child(cam)
		cam.make_current()

		if smoothFollow:
			cam.set_follow_smoothing(smoothSpeed)
			cam.set_enable_follow_smoothing(true)
		else:
			cam.set_enable_follow_smoothing(false)
	else:
		# Initializes the camera, sets its position to that of the player
		update_camera()

		# Connect player to update_camera via signal directly from script
		player.connect("moveSignal", self, "update_camera")

	# enable smooth follow camera
	if smoothFollow: set_process(true)

# ---------------------------------------------------------------------------------
# Center the camera on the player. Automatically called when the player moves.
# ---------------------------------------------------------------------------------
func update_camera():

	# update HUD position when camera is used instead viewport
	if self.useCamera:
		HUD.set_pos(-cam.get_viewport().get_canvas_transform()[2])
		return

	# update viewport
	canvas_transform = get_viewport().get_canvas_transform()
	old_pos = canvas_transform[2]
	new_pos = -player.get_pos() + screen_size / 2

	if !smoothFollow:
		canvas_transform[2].x = new_pos.x
		canvas_transform[2].y = new_pos.y
		get_viewport().set_canvas_transform(canvas_transform)
		HUD.set_pos(-canvas_transform[2])

# ---------------------------------------------------------------------------------
# Smooth follow the camera on the player. Called when smoothFollow is enable (true).
# ---------------------------------------------------------------------------------
func _process(delta):

	# update HUD position when camera is used instead viewport
	if self.useCamera:
		HUD.set_pos(-cam.get_viewport().get_canvas_transform()[2])
		return

	# update viewport
	canvas_transform = get_viewport().get_canvas_transform()
	old_pos = canvas_transform[2]
	new_pos = -player.get_pos() + screen_size / 2

	new_pos.x = lerp(old_pos.x, new_pos.x,smoothSpeed*delta)
	new_pos.y = lerp(old_pos.y, new_pos.y,smoothSpeed*delta)
	canvas_transform[2].x = new_pos.x
	canvas_transform[2].y = new_pos.y
	get_viewport().set_canvas_transform(canvas_transform)
	HUD.set_pos(-canvas_transform[2])