extends CharacterBody2D



#stop walking
var stop_walk = false
var health = Globalscript.enemy_health
var damage = Globalscript.arrow_damage

#speed of enemies
var speed = Globalscript.enemy_speed


#ref the barriers/arrows
var barrier = null
var normal_arrow = null
var raining_arrow = null
var flame_thrower = null
#knockback variables
var is_hurt = false
var knock_back_time = 0.0
var time_to_finsished = 1.0

#death variables
var death_time = 0.0
var time_to_queuefree = 1.0
var is_death = false
#attack variables
var attack_time = 2.0
var time_to_attack = 0.0
var can_attack = false	

	

func _process(delta):
	
	if can_attack == true:
		attack(delta)
	elif is_hurt == true:
		knockback(delta)
	elif is_death == true:
		death(delta)
	else:
		walk(delta)
	
	
	move_and_slide()


func _on_detection_area_area_entered(area:Area2D):
	
	#if enemy is shot handle death and hurt
	if area.is_in_group("arrow"):
		normal_arrow = area	
		can_attack = false
		is_hurt = true
		health -= damage
		
		#define death
		if health <= 0:
			is_death = true 
	else:
		normal_arrow = null
		
		

	if area.is_in_group("rainingarrow"):
		raining_arrow = area
		can_attack = false
		is_hurt = true
		health -= 80	
		if health <= 0:
			is_death = true 
	else:	
		raining_arrow = null
		
	if area.is_in_group("warCrime") && Globalscript.war_crimed == true:
		flame_thrower = area
		can_attack = false
		is_hurt = true
		health -= 40
		if health <= 0:
			is_death = true
	else:
		flame_thrower = null 
	
		
func _on_detection_area_body_entered(body:Node2D):
	if body.is_in_group("barrier"):
		barrier = body
		can_attack = true
	else:
		barrier = null
		can_attack = false
		





func knockback(delta):
	
	knock_back_time += delta
	var friction = float(1.5)
	var knockback_speed = 50 
	$AnimatedSprite2D.play("hurt")
	position.x += knockback_speed * delta / friction
	if knock_back_time >= time_to_finsished:
		knock_back_time = 0.0
		is_hurt = false



func death(delta):
	Globalscript.is_dead = true 
	death_time += delta
	$AnimatedSprite2D.play("death")
	position = position
	if death_time >= time_to_queuefree:
		Globalscript.score += 10
		Globalscript.kill_counter += 1
		Globalscript.current_enemy_number -=1

		death_time = 0.0
		self.queue_free()
	Globalscript.is_dead = false


func walk(delta):
	speed = Globalscript.enemy_speed
	#move the enemy to the left and play walk anim
	$AnimatedSprite2D.play("walk")
	position.x -= speed * delta
	


func attack(delta):
	Globalscript.is_attacking = false
	time_to_attack += delta	
	position = position
	if time_to_attack >= attack_time:
		Globalscript.is_attacking = true  
		$AnimatedSprite2D.play("attack")
		time_to_attack = 0.0
		
		
