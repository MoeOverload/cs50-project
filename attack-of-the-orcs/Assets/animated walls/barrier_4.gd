extends StaticBody2D


@onready var gameOne = $"."




	

func _process(_delta):
	#if enemy is attacking
	if Globalscript.is_attacking == true:
		Globalscript.barrier_health -= Globalscript.barrier_damage
	#handle animations based on health
	if Globalscript.barrier_health > 500:
		$AnimatedSprite2D.play("fullHealth")
	if Globalscript.barrier_health <= 500:
		$AnimatedSprite2D.play("halfHealth")
	if Globalscript.barrier_health <= 0:	
		$AnimatedSprite2D.play("no_health")
		self.collision_layer = 12
	#handle health boost
	if Globalscript.health_boosted == true:
		Globalscript.barrier_health= 100
		self.collision_layer = 1
		
