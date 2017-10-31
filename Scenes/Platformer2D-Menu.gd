extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_ButtonPLAY_button_down():
	get_tree().change_scene("res://Scenes/Template/Platform2D_Template_START.tscn")
