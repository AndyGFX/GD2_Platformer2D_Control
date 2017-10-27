extends Node

enum eState {
		NONE,
		PRESSED,
		RELEASED,
		HOLD
	}

var _key
var _state
var _isHold = false;

func _init(keyName):

	_key = keyName

	set_process_input(true)
	set_process(true)

func _input(event):
	
	if event.is_action_released(_key):
		_state = eState.RELEASED
		_isHold = false
		
	if event.is_action_pressed(_key):
		_state = eState.PRESSED
		_isHold = true

func _process(delta):
	_state = eState.NONE
	pass


func IsPressed():
	if _state==eState.PRESSED: return true
	return false

func IsReleased():
	if _state==eState.RELEASED:
		return true
	return false

func IsHold():
	return self._isHold