extends Area2D

#i forgot why this is here?
var death_time=5
#speed of enemies
@export var speed = 200
#refernce to the game scene
@onready var gameOne = $"res://games/Scripts/game_1.gd"

func _process(delta):
    #move the enemy to the left and play walk anim
    $AnimatedSprite2D.play("walk")
    position.x -= speed * delta

func _on_area_entered(area):
    #if enemytouch player handle hurt and death
    if area.is_in_group("Player"):
        $AnimatedSprite2D.play("hurt")
        
        $AnimatedSprite2D.play("death")
    
        self.queue_free()
    #if enemy is shot handle death and hurt
    elif area.is_in_group("arrow"):
        #add 10 points to the score
        #gameOne.score += 10
        $AnimatedSprite2D.play("hurt")
        
        $AnimatedSprite2D.play("death")
         
        self.queue_free()
