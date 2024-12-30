extends CharacterBody2D

#boosts 
var doubler_points = false
var speed_boost = false
var rapid_fire_boost = false
var raining_arrow_boost = false
var barrier_health_boost = false
var flame_thrower_boost = false

@export var double_pounts_tscn : PackedScene
@export var speed_boost_tscn : PackedScene
@export var rapid_fire_boost_tscn : PackedScene
@export var raining_arrow_boost_tscn : PackedScene
@export var barrier_health_boost_tscn : PackedScene
@export var flamerthrower_boost_tscn : PackedScene

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
var attack_time = 3.0
var time_to_attack = 0.0
var can_attack = false	

	

func _process(delta):
	
	if can_attack == true:
		attack(delta)
	elif is_hurt == true:
		knockback(delta)
	elif is_death == true:
		Globalscript.is_dead = true
		death(delta)
	else:
		walk(delta)
	
	
	move_and_slide()


func _on_detection_area_area_entered(area:Area2D):
	
	#if enemy is shot handle death and hurt
	if area.is_in_group("arrow"):
		$hurt_sound.playing = true
		normal_arrow = area	
		can_attack = false
		is_hurt = true
		health -= damage
		
		#define death
		if health <= 0:
			$hurt_sound.playing = false
			
			is_death = true
			$death_sound.playing = true 
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
	
	death_time += delta
	$AnimatedSprite2D.play("death")
	
	position = position
	if death_time >= time_to_queuefree:
		if Globalscript.double_points == true:
			spawn_boost()
			points_doubler()
			death_time = 0.0
		else:	
			spawn_boost()
			Globalscript.score += 10
			Globalscript.kill_counter += 1
			Globalscript.current_enemy_number -=1
			death_time = 0.0
		
		self.queue_free()
		


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
		$hit_sound.playing = true
		time_to_attack = 0.0
		
		
func points_doubler():
	Globalscript.score += 20
	Globalscript.kill_counter += 1
	Globalscript.current_enemy_number -=1

func spawn_boost():
	set_boost()
	
	if speed_boost == true:
		spawn_speed_boost()
		Globalscript.is_dead = false
	elif doubler_points == true:
		spawn_double_points()
		Globalscript.is_dead = false
	elif rapid_fire_boost == true:
		spawn_rapid_fire_boost()
		Globalscript.is_dead = false
	elif raining_arrow_boost == true:
		spawn_raining_arrows()
		Globalscript.is_dead = false
	elif barrier_health_boost == true:
		spawn_barrier_health_boost()
		Globalscript.is_dead = false
	elif flame_thrower_boost == true:
		spawn_flamethrower_boost()
		Globalscript.is_dead = false

###SPAWN FUNCTIONS####
func spawn_speed_boost():
	var new_speed_boost = speed_boost_tscn.instantiate()
	add_sibling(new_speed_boost)
	new_speed_boost.position = self.position
	

func spawn_rapid_fire_boost():
	var new_rapid_fire_boost = rapid_fire_boost_tscn.instantiate()
	add_sibling(new_rapid_fire_boost)
	new_rapid_fire_boost.position = self.position
	
func spawn_raining_arrows():
	var new_raining_arrow_boost = raining_arrow_boost_tscn.instantiate()
	add_sibling(new_raining_arrow_boost)
	new_raining_arrow_boost.position = self.position
	

func spawn_barrier_health_boost():
	var new_barrier_health_boost = barrier_health_boost_tscn.instantiate()
	add_sibling(new_barrier_health_boost)
	new_barrier_health_boost.position = self.position
	
func spawn_flamethrower_boost():
	var new_flamthrower_boost = flamerthrower_boost_tscn.instantiate()
	add_sibling(new_flamthrower_boost)
	new_flamthrower_boost.position = self.position
	
func spawn_double_points():
	var new_double_points_boost = double_pounts_tscn.instantiate()
	add_sibling(new_double_points_boost)
	new_double_points_boost.position = self.position

####TODO###

#if the spawn number belongs to an array of a boost then
# a new bool variable is set to true
#on death if true spawn that boost
# in ready function call find boost number
# in a seperate function 
#call on spawning boosts depending on the bool of the first function 

func set_boost():
	var doubler_boost_number = [3,23,38,46,18,17,43,26,43,1]
	var speed_boost_number = [4,20,32,45,15,30,49,25,5,7]
	var rapid_fire_number =  [8,12,33,42,22,35,28,24,29,11]
	var raining_arrows_number = [9,50,48]
	var health_boost_number = [21,36,47,2,10,13,16]
	var flamethrower_boost_number = [14,27,37]
	

	if speed_boost_number.has(Globalscript.spawn_number):
		speed_boost = true
	else:
		speed_boost = false
		
	if doubler_boost_number.has(Globalscript.spawn_number):
		doubler_points = true
	else:
		doubler_points = false
	
	if rapid_fire_number.has(Globalscript.spawn_number):
		rapid_fire_boost = true
	else: 
		rapid_fire_boost = false
	
	if raining_arrows_number.has(Globalscript.spawn_number):
		raining_arrow_boost = true
	else:
		raining_arrow_boost = false
	
	if health_boost_number.has(Globalscript.spawn_number):
		barrier_health_boost = true
	else:
		barrier_health_boost = false
	
	if flamethrower_boost_number.has(Globalscript.spawn_number):
		flame_thrower_boost = true
	else:
		flame_thrower_boost = false
