extends Control



var _alpha = 1;
export var speed = 2
var mode = Global.NONE
var isVisible = true

# ---------------------------------------------------------
# Initialize on start
# ---------------------------------------------------------
func _ready():
	set_opacity(1)
	_alpha = get_opacity()	
	isVisible = true	
	pass

# ---------------------------------------------------------
# Set and run transition [NONE/TO_BLACK/TO_TRANSPARENT]
# ---------------------------------------------------------
func Start(_mode):
	mode = _mode
	set_process(true)
	
# ---------------------------------------------------------
# Update
# ---------------------------------------------------------
func _process(delta):
	
	if mode==Global.TO_BLACK: _toBlack(delta)
	if mode==Global.TO_TRANSPARENT: _toTransparent(delta)
	pass

# ---------------------------------------------------------
# HELPER: fade to transparent event
# ---------------------------------------------------------
func _toTransparent(delta):	
	if _alpha>0:
		_alpha -= delta*speed
		set_opacity(_alpha)
		
	if _alpha<=0:
		isVisible = false
		_alpha = 0
		set_opacity(_alpha)
		set_process(false)
		
# ---------------------------------------------------------
# HELPER: Fade to black event
# ---------------------------------------------------------
func _toBlack(delta):	
	if _alpha<1:
		_alpha += delta*speed
		set_opacity(_alpha)
	
	if _alpha>=1:
		isVisible = true
		_alpha = 1
		set_opacity(_alpha)
		set_process(false)
		
