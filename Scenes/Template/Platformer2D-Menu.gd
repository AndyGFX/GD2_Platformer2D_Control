extends Control


func _ready():
	pass


func _on_ButtonPLAY_button_down():
	get_tree().change_scene("res://Scenes/Template/Platform2D_Template_START.tscn")
