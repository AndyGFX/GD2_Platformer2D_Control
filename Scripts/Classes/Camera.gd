# script: camera

extends Camera2D

var magnitude = 0
var timeleft  = 0
var is_shaking = false

func _ready():
	pass

func Shake(new_magnitude, lifetime):
	print("Shake ...")
	if magnitude > new_magnitude: return
	
	magnitude = new_magnitude
	timeleft  = lifetime
	
	if is_shaking: return
	is_shaking = true
	
	while timeleft > 0:
		var pos = Vector2()
		pos.x   = rand_range(-magnitude, magnitude)
		pos.y   = rand_range(-magnitude, magnitude)
		set_pos(pos)
		
		timeleft -= get_process_delta_time()
		yield(get_tree(), "idle_frame")
	
	magnitude = 0
	is_shaking = false
	set_pos(Vector2(0, 0))
	pass

