extends Node

var container = null
var timer = null
var move_control = null
var new_value = null;
func _ready():
	pass

func Start(_move,_container, wait_time, value):
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(30)
	timer.connect("timeout",self,"on_timer_complete")	
	timer.set_wait_time(wait_time)
	_container.add_child(timer)	
	move_control = _move
	new_value = value
	Initialize()	