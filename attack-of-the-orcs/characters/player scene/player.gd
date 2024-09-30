extends CharacterBody2D
#move speed variable
var move_speed = 600
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
		$AnimatedSprite2D.play("walk")
	elif Input.is_action_pressed("down"):
		position.y += 1
		walking = true
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("idle")
		walking = false 	
	#player can shoot moving or stationary
	while walking or not walking:
		#handle shoot input
		if Input.is_action_just_pressed("fire"):
			$AnimatedSprite2D.play("shoot")
			var new_arrow = arrow_tcsn.instantiate()
			add_sibling(new_arrow)
			new_arrow.position = self.position
		break	
	
	#move the player
	velocity = velocity.normalized() * move_speed * delta
	move_and_slide()

#if enemy touches player player dies
########TODO##########
#change so when the barriers break open and zombies cross a certain threshhold 
#the zombies move twards the player touching player forcefully

func _on_area_2d_body_entered(body:Node2D):
	if body.is_in_group("enemy"):
		$AnimatedSprite2D.play("hurt")
		
		Globalscript.is_game_over = true
		$AnimatedSprite2D.play("death")

		self.queue_free()