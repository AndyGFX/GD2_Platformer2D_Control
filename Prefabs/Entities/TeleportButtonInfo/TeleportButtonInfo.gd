extends Node2D

var anim = null

func _ready():
	anim = get_node("AnimationPlayer");
	
func Show():
	anim.play("FadeOut")	

func Hide():
	anim.play_backwards("FadeOut");
	
	