extends Label

func _ready():
	get_node("AnimationPlayer").connect("finished", self, "RemoveHitPoints")
	pass
	
func RemoveHitPoints():
	queue_free()
	pass
