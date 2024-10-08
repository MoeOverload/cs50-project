extends Node2D
#barrier variables
var health = Globalscript.barrier_health
@onready var gameOne = $"."
var enemy = null
var is_attacking = false
var damage_time = 2.0
var time_to_damage = 0.0

######TODO#######
#configure so each barrier is its own NODE within a wall node 
#each barrier should be its own node reacting seperatly from others taking damage
#individually, this should fix the damage timer.

#####TODO#######
#make the rounds effect how much damage the wall can take
#the wall resets between rounds 

	
		

func _process(delta):
	#if enemy then set time intrevals between taking damage
	if is_attacking == true:
		time_to_damage += delta
	if time_to_damage >= damage_time:
		health = health - 5
		time_to_damage = 0.0
	
	#handle animations based on health
	if health > 50:
		$AnimatedSprite2D.play("fullHealth")
	if health  <= 50:
		$AnimatedSprite2D.play("halfHealth")
	if health == 0:	
		$AnimatedSprite2D.play("halfHealth")
		self.queue_free()

		

func _on_enemy_detection_area_entered(area:Area2D):
	if area.is_in_group("enemy"):
		enemy = area
		is_attacking = true
