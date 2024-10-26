extends CharacterBody2D
#stop walking
var stop_walk = false
var health = Globalscript.enemy_health
var damage = Globalscript.arrow_damage
#speed of enemies
var speed = Globalscript.enemy_speed
var stop_speed = 0
#refernce to the game scene
@onready var gameOne = $"."
#ref the barriers/arrows
var barrier = null
var arrow = null
#knockback variables
var is_hurt = false
var knock_back_time = 0.0
var time_to_finsished = 1.0
#death variables
var death_time = 0.0
var time_to_queuefree = 2.0
var is_death = false



func _process(delta):
	if stop_walk == true:
		attack(delta)
	
	elif is_hurt == true:
		knockback(delta)
	
	elif is_death == true:
		death(delta)
	
	elif is_death == false and is_hurt == false and stop_walk == false:
		walk(delta)
	
	
	move_and_slide()


func _on_detection_area_area_entered(area:Area2D):
	#if reaches the barrier
	if area.is_in_group("barrierDetect"):
		barrier = area
		stop_walk = true
	else:
		barrier = null
		stop_walk = false
	#if enemy is shot handle death and hurt
	if area.is_in_group("arrow"):
		arrow = area	
		health -= damage
		
		#define hurt
		if health > 0 :
			is_hurt = true
			
		#define death
		elif health <= 0:
			is_death = true 
			Globalscript.kill_counter += 1
			Globalscript.score += 10 	
	else:
		arrow = null
		is_hurt = false
			

		
func knockback(delta):
	knock_back_time += delta
	var friction = float(1.0)
	var knockback_speed = 50 
	$AnimatedSprite2D.play("hurt")
	position.x += knockback_speed * delta / friction
	if knock_back_time >= time_to_finsished:
		is_hurt = false
		knock_back_time = 0.0



func death(delta):
	death_time += delta
	$AnimatedSprite2D.play("death")
	position.x = position.x 
	if death_time >= time_to_queuefree:
		self.queue_free()
		death_time = 0.0


func walk(delta):
	speed = Globalscript.enemy_speed
	#move the enemy to the left and play walk anim
	$AnimatedSprite2D.play("walk")
	position.x -= speed * delta
	


func attack(delta):
	$AnimatedSprite2D.play("attack")
	position.x += stop_speed * delta
	
	


		
		



	
