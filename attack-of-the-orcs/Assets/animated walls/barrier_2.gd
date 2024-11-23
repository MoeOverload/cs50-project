extends StaticBody2D
#barrier variables
var health = 100
@onready var gameOne = $"."
var enemy = null


	

func _process(_delta):
	if Globalscript.is_attacking == true:
		health = health - randi_range(1,10)
	#handle animations based on health
	if health > 50:
		$AnimatedSprite2D.play("fullHealth")
	elif health  <= 50:
		$AnimatedSprite2D.play("halfHealth")
	elif health <= 0:	
		$AnimatedSprite2D.play("halfHealth")
		self.visible = false
		#handle health boost
	elif Globalscript.health_boosted == true:
		health = 100
		self.visible = true
		
		                            
