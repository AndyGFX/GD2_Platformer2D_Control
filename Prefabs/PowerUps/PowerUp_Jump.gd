extends "res://Prefabs/PowerUps/PowerUp.gd"

	
func Initialize():
	move_control.SetJumpForce(new_value)
	timer.start()
	pass
	
func on_timer_complete():
	move_control.RestoreJumpForce()
	queue_free()
		