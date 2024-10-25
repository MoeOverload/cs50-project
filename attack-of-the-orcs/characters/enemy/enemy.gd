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
	if stop_walk == true:
		speed = 0
		$AnimatedSprite2D.play("attack")
		position.x -= speed * delta
	elif is_death == true:
		$AnimatedSprite2D.play("death")
		position.x -= speed * delta
	else:
		speed = Globalscript.enemy_speed
		#move the enemy to the left and play walk anim
		$AnimatedSprite2D.play("walk")
		position.x -= speed * delta
	


func knockback():
	var friction = float(2.0)
	var knockback_speed = 100 
	$AnimatedSprite2D.play("hurt") 
	position.x += knockback_speed / friction

	
#check for areas entered
func _on_area_entered(area):
	#if reaches the barrier
	if area.is_in_group("barrierDetect"):
		stop_walk = true
	stop_walk = false
	#if enemy is shot handle death and hurt
	if area.is_in_group("arrow"):
			#damage enemy health
		health -= damage
		Globalscript.score += 10
		if health > 0 :
			knockback()	
		#define death
		if health <= 0:
			knockback()
			is_death = true 
			Globalscript.kill_counter += 1 
			self.queue_free()
	else:
		is_hurt = false
		
		



	
