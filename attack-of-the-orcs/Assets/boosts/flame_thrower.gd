extends Area2D

func _process(_delta):
	
	if Globalscript.war_crimed == true:
		if Globalscript.is_criming == true:
			$AnimatedSprite2D.play("flame_throw_start")
			$AnimatedSprite2D.play("flame throw")
		else:
			$AnimatedSprite2D.play("flame_done")
	
		
