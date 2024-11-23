extends Node2D
@export var enemy: PackedScene
@export var speed_boost_tscn : PackedScene
@export var rapid_fire_boost_tscn : PackedScene
@export var raining_arrow_boost_tscn : PackedScene
@export var barrier_health_boost_tscn : PackedScene
@export var flamerthrower_boost_tscn : PackedScene
#boost spawn variables
var speed_boost = false
var rapid_fire_boost = false
var raining_arrow_boost = false
var barrier_health_boost = false
var flame_thrower_boost = false


func _process(_delta):
	set_boost()
	if Globalscript.is_dead == true:
		spawn_boost()
	

func spawn_boost():
	if speed_boost == true:
		spawn_speed_boost()
	elif rapid_fire_boost == true:
		spawn_rapid_fire_boost()
	elif raining_arrow_boost == true:
		spawn_raining_arrows()
	elif barrier_health_boost == true:
		spawn_barrier_health_boost()
	elif flame_thrower_boost == true:
		spawn_flamethrower_boost()



###SPAWN FUNCTIONS####
func spawn_speed_boost():
	var new_speed_boost = speed_boost_tscn.instantiate()
	add_sibling(new_speed_boost)
	new_speed_boost.position = enemy.position

func spawn_rapid_fire_boost():
	var new_rapid_fire_boost = rapid_fire_boost_tscn.instantiate()
	add_sibling(new_rapid_fire_boost)
	new_rapid_fire_boost.position = enemy.position

func spawn_raining_arrows():
	var new_raining_arrow_boost = raining_arrow_boost_tscn.instantiate()
	add_sibling(new_raining_arrow_boost)
	new_raining_arrow_boost.position = enemy.position
	

func spawn_barrier_health_boost():
	var new_barrier_health_boost = barrier_health_boost_tscn.instantiate()
	add_sibling(new_barrier_health_boost)
	new_barrier_health_boost.position = enemy.position

func spawn_flamethrower_boost():
	var new_flamthrower_boost = flamerthrower_boost_tscn.instantiate()
	add_sibling(new_flamthrower_boost)
	new_flamthrower_boost.position = enemy.position

####TODO###

#if the spawn number belongs to an array of a boost then
# a new bool variable is set to true
#on death if true spawn that boost
# in ready function call find boost number
# in a seperate function 
#call on spawning boosts depending on the bool of the first function 

func set_boost():
	var speed_boost_number = [4,20,32,45,15,30,49,25,5,7]
	var rapid_fire_number =  [8,12,33,42,22,35,28,24,29,11]
	var raining_arrows_number = [9,50,45]
	var health_boost_number = [21,36,47,2,10,13,16]
	var flamethrower_boost_number = [14,27,37]
	speed_boost_number.sort()
	rapid_fire_number.sort()
	raining_arrows_number.sort()
	health_boost_number.sort()
	flamethrower_boost_number.sort()

	if speed_boost_number.has(Globalscript.spawn_number):
		speed_boost = true
	else:
		speed_boost = false
	
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
