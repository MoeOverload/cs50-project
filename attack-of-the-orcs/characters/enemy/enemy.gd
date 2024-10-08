extends Area2D
#stop walking
var stop_walk = false
var health = Globalscript.enemy_health
var speed = Globalscript.enemy_speed
var damage = Globalscript.arrow_damage
#speed of enemies

#refernce to the game scene
@onready var gameOne = $"."

func _process(delta):
	if stop_walk == true:
		speed = 0
		$AnimatedSprite2D.play("attack")
		position.x -= speed * delta
	else:
		#move the enemy to the left and play walk anim
		$AnimatedSprite2D.play("walk")
		position.x -= speed * delta
#check for areas entered
func _on_area_entered(area):
	#if reaches the barrier
	if area.is_in_group("barrierDetect"):
		$AnimatedSprite2D.play("attack")
		stop_walk = true
	#if enemy is shot handle death and hurt
	elif area.is_in_group("arrow"):
		#add 10 points to the score
		Globalscript.score += 10
		if health > 0 :
			#damage enemy health
			health -= damage
			
			
			$AnimatedSprite2D.play("hurt")
		#define death
		if health <= 0:
			$AnimatedSprite2D.play("death")
			self.queue_free()
	
		



