extends CharacterBody2D
var move_speed = 200
@export var arrow_tcsn: PackedScene

@onready var mainscene = $".."
var walking = false 

func _physics_process(delta):
	velocity = Vector2()
	

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
		
	while walking or not walking:

		if Input.is_action_just_pressed("fire"):
			$AnimatedSprite2D.play("shoot")
			var new_arrow = arrow_tcsn.instantiate()
			add_sibling(new_arrow)
			new_arrow.position = self.position
		break	
	
	
	
	
	
	

	velocity = velocity.normalized() * move_speed * delta
	move_and_slide()


func _on_area_2d_area_entered(area):
	if area.is_in_group("enemy"):
		$AnimatedSprite2D.play("hurt")
		
		mainscene.is_game_over = true
		$AnimatedSprite2D.play("death")

		self.queue_free()


	
