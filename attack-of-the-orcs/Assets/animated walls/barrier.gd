extends StaticBody2D
#barrier variables
var health = Globalscript.barrier_health
@onready var gameOne = $"."
var enemy = null
var is_attacking = false
var damage_time = 2.0
var time_to_damage = 0.0
	

func _physics_process(delta):
	#if enemy then set time intrevals between taking damage
	if is_attacking == true:
		time_to_damage += delta
	if time_to_damage >= damage_time:
		health = health - 5
		time_to_damage = 0.0
	#handle health boost
	if Globalscript.health_boosted == true:
		health += Globalscript.boost_health
	Globalscript.health_boosted = false
	#handle animations based on health
	if health > 50:
		$AnimatedSprite2D.play("fullHealth")
	if health  <= 50:
		$AnimatedSprite2D.play("halfHealth")
	if health == 0:	
		$AnimatedSprite2D.play("halfHealth")
		self.queue_free()



func _on_enemy_detection_body_entered(body:Node2D):
	
	if body.is_in_group("enemy"):
		enemy = body
		is_attacking = true
	else:
		enemy = null
		is_attacking = false