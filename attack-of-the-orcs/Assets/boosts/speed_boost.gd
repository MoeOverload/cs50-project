extends Area2D
#boost move speed
var speed = 100
var rotation_speed = 3
var player = null

func _process(delta):
	position.x -= speed * delta
	rotation += rotation_speed * delta


