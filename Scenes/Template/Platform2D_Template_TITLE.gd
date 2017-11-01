extends Control

var cInput = load("res://Scripts/Classes/InputManager.gd")
var space = null

func _ready():
	space = cInput.new("key_jump"); add_child(space)

	set_process(true)
	get_node("Label/AnimationPlayer").play("Flashtext")
	pass

func _process(delta):
	if space.IsPressed():
		get_tree().change_scene("res://Scenes/Template/Platform2D_Template_MENU.tscn")
