extends KinematicBody2D

var global = preload("res://Global.gd")
var moveHorizontaly = preload("res://Scripts/Classes/MoveHorizontaly.gd")
var moveVerticaly = preload("res://Scripts/Classes/MoveVerticaly.gd")
var input = preload("res://Scripts/Classes/KeyInputs.gd")

# exports to inspector
export var playerMaxSpeed = 200
export var acceleration = 0.2

var key_left = null
var key_right= null
var key_up= null
var key_down= null

var movement_H = null;
var movement_V = null;

func _ready():
	
	#create input control
	key_left = input.new("key_left")
	key_right = input.new("key_right")
	key_up = input.new("key_up")
	key_down = input.new("key_down")
	
	# get player object
	var player = get_node(".")
	
	# create horizontal control manager
	movement_H = moveHorizontaly.new(player, key_left,key_right,playerMaxSpeed,acceleration)
	
	# create vertical control manager 
	movement_V = moveVerticaly.new(player, key_up,key_down,playerMaxSpeed,acceleration)
	
	# enable update per frame
	set_fixed_process(true)
	
func _fixed_process(delta):
	
	# realize horizontal movement
	movement_H.Apply(delta)	
	# realize vertical movement
	movement_V.Apply(delta)	
