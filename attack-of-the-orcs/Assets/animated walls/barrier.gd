extends Node2D
#barrier variables
var barrier_health = 100
@onready var gameOne = $"."
var enemy = null
var is_attacking = false
var damage_time = 2.0
var time_to_damage = 0.0

func _on_enemy_detection_area_entered(area:Area2D):
	#detect enemy 
	if area.is_in_group("enemy"):
		enemy = area
		is_attacking = true
		

func _process(delta):
	#if enemy then set time intrevals between taking damage
	if is_attacking == true:
		time_to_damage += delta
	if time_to_damage >= damage_time:
		barrier_health = barrier_health - 5
		time_to_damage = 0.0
	
	#handle animations based on health
	if barrier_health > 50:
		$AnimatedSprite2D.play("fullHealth")
	if barrier_health  <= 50:
		$AnimatedSprite2D.play("halfHealth")
	if barrier_health == 0:	
		$AnimatedSprite2D.play("halfHealth")
		self.queue_free()






	
		
