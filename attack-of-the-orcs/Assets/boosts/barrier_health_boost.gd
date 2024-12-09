extends Area2D
#boost variables
var speed = 75
var rotation_speed = 3
var boost_end_time = 3.0
var boost_time = 0.0
var player = null
func _process(delta):
	#boost movement/ rotation
	position.x -= speed * delta
	rotation += rotation_speed * delta
	#if boost is active
	if Globalscript.health_boosted == true:
		#increment timer
		boost_time += delta
	#on timer end
	elif boost_time >= boost_end_time:
		Globalscript.health_boosted = false
		boost_time = 0.0
		self.queue_free()
#if area is the player
func _on_area_entered(area:Area2D):
	if area.is_in_group("Player"):
		player = area
		Globalscript.health_boosted = true
		self.visible = false
	player = null
