extends Area2D
#stop walking
var stop_walk = false
#i forgot why this is here?
var enemy_health = 50
#speed of enemies
@export var speed = 200
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

func _on_area_entered(area):
    if area.is_in_group("barrierDetect"):
        $AnimatedSprite2D.play("attack")
        stop_walk = true



        #if enemytouch player handle hurt and death
    elif area.is_in_group("Player"):
        $AnimatedSprite2D.play("hurt")
        
        $AnimatedSprite2D.play("death")
    
        self.queue_free()
    #if enemy is shot handle death and hurt
    elif area.is_in_group("arrow"):
        if enemy_health > 0 :
            #damage enemy health
            enemy_health = enemy_health - 25
            #add 10 points to the score
            Globalscript.score += 10
            $AnimatedSprite2D.play("hurt")
            
        if enemy_health == 0:
            $AnimatedSprite2D.play("death")
            self.queue_free()
    
        
