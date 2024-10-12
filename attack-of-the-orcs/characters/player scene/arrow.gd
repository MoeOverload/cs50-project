extends Area2D




#arrow move speed
var speed: float = 300

func _process(delta):
	#moving  the arrow
	position.x +=  speed * delta 
	
	
	
	#if arrow hits enemy make arrow dissapear 
func _on_area_entered(area):
	if area.is_in_group("enemy"):
		self.queue_free()
