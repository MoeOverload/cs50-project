extends Area2D
#arrow move speed
var speed = 300

func _process(delta):
	#moving  the arrow
	position.x += speed * delta 
	
	
	
#if arrow hits enemy make arrow dissapear 
func _on_body_entered(body:Node2D):
	if body.is_in_group("enemy"):
		self.queue_free()