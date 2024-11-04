extends CharacterBody2D
#arrow fire timer variables
var can_fire = false
#reference to the arrow scene
@export var arrow_tcsn: PackedScene
#rewfernce to the game scene
@onready var gameOne = $"."
#reference to the speed_boost
var speed_boost = null
var speed_boosted = false
var boost_end_time = 10.0
var boost_time = 0.0
var boost_multiplier = 2.5
#reference to the health boost
var health_boost = null

#boolean is walking
var walking = false 

func _physics_process(delta):
	
	velocity = Vector2()
	
#handle input events & animations
	if Input.is_action_pressed("up"):
		position.y -= 1
		walking=true
		$Sprite2D/AnimationPlayer.play("walk")
	elif Input.is_action_pressed("down"):
		position.y += 1
		walking = true
		$Sprite2D/AnimationPlayer.play("walk")
	else:
		$Sprite2D/AnimationPlayer.play("idle")
		walking	 = false 	
	#player can shoot moving or stationary
	while walking or not walking:
		#handle shoot input
		single_shot()
		break
	
	#move the player
	if speed_boosted != true:
		velocity = velocity.normalized() * Globalscript.move_speed * delta
	####TODO###
	#get the speed boost to work
	elif speed_boosted == true:
		print("speedy")
		velocity = velocity * Globalscript.move_speed * boost_multiplier *delta
	move_and_slide()


func _on_timer_timeout():
	can_fire = true 


func single_shot():
	if can_fire == true && Input.is_action_pressed("fire"):
		$Sprite2D/AnimationPlayer.play("aiming")
	if can_fire == true && Input.is_action_just_released("fire"):
		$Sprite2D/AnimationPlayer.play("fire")
		var new_arrow = arrow_tcsn.instantiate()
		add_sibling(new_arrow)
		new_arrow.position = self.position
		can_fire = false


	

func _on_area_2d_area_entered(area:Area2D):
	if area.is_in_group("speed_boost"):
		speed_boost = area
		speed_boosted = true
		speed_boost.queue_free()
		boost_time += get_process_delta_time()
		if boost_end_time == boost_time:
			speed_boosted = false
			speed_boost = null
			boost_time = 0.0 
	if area.is_in_group("barrier_health_boost"):
		health_boost = area
		Globalscript.health_boosted = true
		health_boost.queue_free()
		health_boost = null
