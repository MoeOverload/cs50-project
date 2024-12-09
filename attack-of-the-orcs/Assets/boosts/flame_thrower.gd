extends Area2D

func _process(_delta):
	
	
	if Globalscript.crime_start == true:
		self.visible = true
		$AnimatedSprite2D.play("flame_throw_start")
	elif  Globalscript.is_criming == true:
			$AnimatedSprite2D.play("flame throw")
	elif  Globalscript.war_crimed == false:
		$AnimatedSprite2D.play("flame_done")
		self.visible = false
		
