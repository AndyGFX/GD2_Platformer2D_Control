extends "res://Prefabs/PowerUps/PowerUp.gd"

	
func Initialize():
	move_control.SetGravity(new_value)
	timer.start()
	pass
	
func on_timer_complete():	
	move_control.RestoreGravity()
	queue_free()
		