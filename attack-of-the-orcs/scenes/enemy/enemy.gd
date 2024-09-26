extends Area2D


var death_time=5

@export var speed = 200

@onready var mainscene = $"../.."

func _process(delta):
    $AnimatedSprite2D.play("walk")
    position.x -= speed * delta






func _on_area_entered(area):
    if area.is_in_group("Player"):
        $AnimatedSprite2D.play("hurt")
        
        $AnimatedSprite2D.play("death")
    
        self.queue_free()
    elif area.is_in_group("arrow"):
        
        mainscene.score += 10
        $AnimatedSprite2D.play("hurt")
        
        $AnimatedSprite2D.play("death")
         
        self.queue_free()