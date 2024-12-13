extends Area2D

func _process(_delta):
		
	if  Globalscript.is_criming == true:
		self.visible = true
		$flamesound.playing = true
		$AnimatedSprite2D.play("flame_throw_start")
	if  Globalscript.war_crimed == false:
		$AnimatedSprite2D.play("flame_done")
		$flamesound.playing = false
		self.visible = false
		
