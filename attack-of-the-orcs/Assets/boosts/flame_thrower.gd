extends Area2D

func _process(_delta):
	
	
	
	if Globalscript.is_criming == true:
		$AnimatedSprite2D.play("flame throw")
	
	if Globalscript.is_criming == false:
		$AnimatedSprite2D.play("flame_done")
		Globalscript.crime_cooldown = true
