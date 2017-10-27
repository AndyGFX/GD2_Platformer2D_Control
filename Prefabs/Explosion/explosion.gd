# script: explosion

extends Sprite

func _ready():
	randomize()
	set_rot(deg2rad(rand_range(0, 360)))
	
	get_node("particle_smoke").set_emitting(true)
	get_node("particle_flare").set_emitting(true)
	
	Utils.remote_call("Camera", "Shake", 8, 0.2)
	Global.player_sfx.player.play("Explosion2")
	
	
	get_node("anim").play("fade_out")
	yield(get_node("anim"), "finished")
	queue_free()
	pass
