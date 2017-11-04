extends "res://Prefabs/PowerUps/PowerUp.gd"

	
func Initialize():
	Inventory.items.powerup_jump = 1
	move_control.SetJumpForce(new_value)
	timer.start()
	pass
	
func on_timer_complete():
	Inventory.items.powerup_jump = 0
	move_control.RestoreJumpForce()
	queue_free()
		