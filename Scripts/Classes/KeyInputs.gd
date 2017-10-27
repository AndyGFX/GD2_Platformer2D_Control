var assigned_key = ""
var input
var input_pressed = false
var input_released = false

# -----------------------------------------------------------
# Input class Contructor
# -----------------------------------------------------------
func _init(key_name):
	self.assigned_key = key_name


# -----------------------------------------------------------
# Check if is pressed
# -----------------------------------------------------------
func IsPressed():

	input = Input.is_action_pressed(self.assigned_key)
	return input
