extends Control

# ------------------------------------------
# Initialize on start
# ------------------------------------------
func _ready():
	get_node("VBoxContainer/Button-PLAY").grab_focus()
	pass


# ------------------------------------------
# PLAY
# ------------------------------------------
func _on_ButtonPLAY_button_down():
	get_tree().change_scene("res://Scenes/Template/Platform2D_Template_START.tscn")

# ------------------------------------------
# OPTIONS
# ------------------------------------------
func _on_ButtonOPTION_button_down():
	pass # replace with function body

# ------------------------------------------
# EXIT
# ------------------------------------------
func _on_ButtonEXIT_button_down():
	Inventory.Save()
	get_tree().quit()
	pass # replace with function body



