extends CharacterBody2D
#arrow fire timer variables
var can_fire = false
var can_rapid_fire = false
#reference to the arrow scene
@export var arrow_tcsn: PackedScene
#refernce to flamethrower
@export var flame_thrower_tcsn: PackedScene
#rewfernce to the game scene
@onready var gameOne = $"."

#reference to the speed_boost
var boost_speed = 160
#rapid fire timer
var fire_time = 0.0
var time_to_fire = 0.2

func _process(delta):
	#move the player
	if Input.is_action_pressed("up") :
		position.y -= Globalscript.move_speed * delta
		
		
		$Sprite2D/AnimationPlayer.play("walk")
		
	elif Input.is_action_pressed("down"):
		position.y += Globalscript.move_speed * delta
		
		$Sprite2D/AnimationPlayer.play("walk")
		
	else:
		$Sprite2D/AnimationPlayer.play("idle")
	#handle attacks
	#handle damageboost
	if Globalscript.speed_boosted == true:
		boost_damager(delta)
		single_shot(delta)
		#handle rapid fire input
	elif Globalscript.rapid_fire_boosted == true:
		rapid_fire(delta)
		
	elif Globalscript.war_crimed == true:
		war_crime(delta)
	else:
		Globalscript.arrow_damage = 25
		single_shot(delta)

	move_and_slide()
				

func single_shot(_delta):
	if not Globalscript.war_crimed and Input.is_action_pressed("fire"):
		$Sprite2D/AnimationPlayer.play("aiming")
	if not Globalscript.war_crimed and can_fire == true && Input.is_action_just_released("fire"):
		$Sprite2D/AnimationPlayer.play("fire")
		 
		$arrowsound.playing = true 
		var new_arrow = arrow_tcsn.instantiate()
		add_sibling(new_arrow)
		new_arrow.position = self.position 
		can_fire = false
func _on_timer_timeout():
	can_fire = true

func rapid_fire(delta):
	
	if not Globalscript.war_crimed and Input.is_action_pressed("fire"):
		fire_time += delta
		if fire_time >= time_to_fire:
			$Sprite2D/AnimationPlayer.play("fire")
			$rapidfiresound.playing = true
			var new_arrow = arrow_tcsn.instantiate()
			add_sibling(new_arrow)
			new_arrow.position = self.position
			fire_time = 0.0
			

func war_crime(_delta):
	
	if Input.is_action_pressed("fire"):
		Globalscript.is_criming = true
		
	elif Input.is_action_just_released("fire"):
		Globalscript.is_criming = false
		
		
	

	
func boost_damager(_delta):
	
	Globalscript.arrow_damage = Globalscript.enemy_health
