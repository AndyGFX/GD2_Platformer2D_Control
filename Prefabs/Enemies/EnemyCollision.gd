extends Area2D


func _ready():
	pass

# ---------------------------------------------------------
# When player hit enemy callback Damage on Player
# ---------------------------------------------------------
func _on_Player_area_enter( area ):
	var parent = area.get_parent()	
	if parent.has_method("Damage"):
		parent.Damage(10,get_parent().get_node(".").move.GetVelocity())


