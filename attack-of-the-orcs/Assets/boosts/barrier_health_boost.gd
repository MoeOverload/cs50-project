extends Area2D
#boost move speed
var speed = 100
var rotation_speed = 3

func _process(delta):
	position.x -= speed * delta
	rotation += rotation_speed * delta

func _on_body_entered(body:Node2D):
	if body.is_in_group("player"):
		
		self.queue_free()
