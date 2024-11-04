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
@export var speed_boost_tscn : PackedScene
@export var rapid_fire_boost_tscn : PackedScene
@export var raining_arrow_boost_tscn : PackedScene
@export var barrier_health_boost_tscn : PackedScene
#ref the barriers/arrows
var barrier = null
var arrow = null

#knockback variables
var is_hurt = false
var knock_back_time = 0.0
var time_to_finsished = 1.0

#death variables
var death_time = 0.0
var time_to_queuefree = 1.0
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
			
func _on_detection_area_body_entered(body:Node2D):
	if body.is_in_group("barrierDetect"):
		barrier = body
		stop_walk = true
	else:
		barrier = null
		stop_walk = false
		
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
		spawn_boosts()
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

func spawn_boosts():
	var spawn_number = 20#randi_range(1,20)
	var speed_boost_number = 5
	var rapid_fire_number = 10
	var raining_arrows_number = 15
	var health_boost_number = 20

	if spawn_number == speed_boost_number:
		spawn_speed_boost()
	elif spawn_number == rapid_fire_number:
		spawn_rapid_fire_boost()
	elif spawn_number == raining_arrows_number:
		spawn_raining_arrows()
	elif spawn_number == health_boost_number:
		spawn_barrier_health_boost()


