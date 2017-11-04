extends "res://Prefabs/PowerUps/PowerUp.gd"


func Initialize():
	Inventory.items.powerup_gravity = 1
	move_control.SetGravity(new_value)
	timer.start()
	pass

func on_timer_complete():
	Inventory.items.powerup_gravity = 0
	move_control.RestoreGravity()
	queue_free()
