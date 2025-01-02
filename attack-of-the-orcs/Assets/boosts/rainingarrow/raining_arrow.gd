extends Node2D

var speed = 300

func _process(delta):
	#moving  the arrow
	
	position.y += speed * delta 
	
	
	
#if arrow hits enemy make arrow dissapear 
func _on_area_2d_body_entered(body:Node2D):
	
	if body.is_in_group("enemy"):
		self.queue_free()
