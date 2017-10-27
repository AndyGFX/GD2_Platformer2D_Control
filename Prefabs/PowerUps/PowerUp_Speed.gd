extends "res://Prefabs/PowerUps/PowerUp.gd"

	
func Initialize():	
	move_control.SetSpeed(new_value)
	timer.start()
	pass
	
func on_timer_complete():
	move_control.RestoreSpeed()	
	queue_free()
		