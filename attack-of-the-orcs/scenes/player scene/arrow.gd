extends Area2D





@export var speed: float = 600

func _process(delta):
    position.x +=  speed * delta 
    
    
    
    
func _on_area_entered(area:Area2D):
    if area.is_in_group("enemy"):
        self.queue_free()

