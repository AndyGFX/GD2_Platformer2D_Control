extends Node2D

var player = null

# -----------------------------------------------------------
# Initialize on start
# -----------------------------------------------------------
func _ready():
	player = get_node("SFXPlayer")

	pass

# -----------------------------------------------------------
# Play sound fx by name and return voiceID
# -----------------------------------------------------------
func Play(name):
	return player.play(name)



