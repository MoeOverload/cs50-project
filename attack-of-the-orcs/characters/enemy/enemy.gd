extends CharacterBody2D

#stop walking
var stop_walk = false
var health = Globalscript.enemy_health
var damage = Globalscript.arrow_damage

#speed of enemies
var speed = Globalscript.enemy_speed

#refernce to the game scene
@onready var gameOne = $"."
@export var speed_boost_tscn : PackedScene
@export var rapid_fire_boost_tscn : PackedScene
@export var raining_arrow_boost_tscn : PackedScene
@export var barrier_health_boost_tscn : PackedScene
@export var flamerthrower_boost_tscn : PackedScene
#ref the barriers/arrows
var barrier = null
var normal_arrow = null
var raining_arrow = null
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
var spawn_number = randi_range(0,50)
func _ready():
	print(spawn_number)
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
		health -= 40	
		if health <= 0:
			is_death = true 
	else:	
		raining_arrow = null
		
		
	
		
func _on_detection_area_body_entered(body:Node2D):
	if body.is_in_group("barrier"):
		barrier = body
		can_attack = true
	else:
		barrier = null
		





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
		
		
		Globalscript.score += 10
		Globalscript.kill_counter += 1
		death_time = 0.0
		self.queue_free()
		spawn_boosts()


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

####TODO###

#if the spawn number belongs to an array of a boost then
# a new bool variable is set to true
#on death if true spawn that boost
# in ready function call find boost number
# in a seperate function 
#call on spawning boosts depending on the bool of the first function 

func spawn_boosts():
	var speed_boost_number = [4,20,32,45,15,30,49,25,5,7]
	var rapid_fire_number =  [8,12,33,42,22,35,28,24,29,11]
	var raining_arrows_number = [9,50,45]
	var health_boost_number = [21,36,47,2,10,13,16]
	var flamethrower_boost_number = [1,27,37]

	if speed_boost_number.bsearch(spawn_number, true):
		spawn_speed_boost()
	if rapid_fire_number.bsearch(spawn_number, true):
		spawn_rapid_fire_boost()
	if raining_arrows_number.bsearch(spawn_number, true):
		spawn_raining_arrows()
	if health_boost_number.bsearch(spawn_number, true):
		spawn_barrier_health_boost()
	if flamethrower_boost_number.bsearch(spawn_number, true):
		spawn_flamethrower_boost()