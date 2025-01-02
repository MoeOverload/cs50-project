extends Area2D

func _process(_delta):
		
	if  Globalscript.war_crimed == true and Globalscript.is_criming == true:
		$CollisionShape2D.disabled = false
		self.visible = true
		$AnimatedSprite2D.play("flame_throw_start")
		$flamesound.playing = true
	elif Globalscript.war_crimed == false or Globalscript.is_criming == false:
		$CollisionShape2D.disabled = true
		$AnimatedSprite2D.play("flame_done")
		$flamesound.playing = false
		if $AnimatedSprite2D.animation_finished:
			self.visible = false
		
