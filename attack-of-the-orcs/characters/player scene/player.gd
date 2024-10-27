extends CharacterBody2D
#arrow fire timer variables
var can_fire = false
#reference to the arrow scene
@export var arrow_tcsn: PackedScene
#rewfernce to the game scene
@onready var gameOne = $"."

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
		if can_fire == true && Input.is_action_pressed("fire"):
			$Sprite2D/AnimationPlayer.play("aiming")
		if can_fire == true && Input.is_action_just_released("fire"):
			$Sprite2D/AnimationPlayer.play("fire")
			var new_arrow = arrow_tcsn.instantiate()
			add_sibling(new_arrow)
			new_arrow.position = self.position
			can_fire = false
		
		break
	
	#move the player
	velocity = velocity.normalized() * Globalscript.move_speed * delta
	move_and_slide()


func _on_timer_timeout():
	can_fire = true 
