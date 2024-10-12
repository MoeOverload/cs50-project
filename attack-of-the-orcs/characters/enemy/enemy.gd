extends Area2D
#stop walking
var stop_walk = false
var is_hurt = false
var is_death = false
var health = Globalscript.enemy_health
var speed = Globalscript.enemy_speed
var damage = Globalscript.arrow_damage
#speed of enemies

#refernce to the game scene
@onready var gameOne = $"."

func _process(delta):
	print(health)
	if stop_walk == true:
		speed = 0
		$AnimatedSprite2D.play("attack")
		position.x -= speed * delta
	elif is_hurt == true:
		speed = 0
		$AnimatedSprite2D.play("hurt")
		position.x -= speed * delta 
	elif is_death == true:
		speed = 0 
		$AnimatedSprite2D.play("death")
		
		position.x  -= speed * delta
	else:
		#move the enemy to the left and play walk anim
		$AnimatedSprite2D.play("walk")
		position.x -= speed * delta
	



	
#check for areas entered
func _on_area_entered(area):
	#if reaches the barrier
	if area.is_in_group("barrierDetect"):
		stop_walk = true
	#if enemy is shot handle death and hurt
	if area.is_in_group("arrow"):
		#damage enemy health
		health -= damage
		Globalscript.score += 10
		if health > 0 :
			is_hurt = true	
		#define death
		if health <= 0:
			is_death = true 
			Globalscript.kill_counter += 1 
			self.queue_free()
	else:
		is_hurt = false
		
		



