extends Area2D
#boost move speed
var speed = 100
var rotation_speed = 3
var boost_end_time = 1.0
var boost_time = 0.0
var player = null
func _process(delta):
	position.x -= speed * delta
	rotation += rotation_speed * delta
	if Globalscript.health_boosted == true:
		boost_time += delta
	if boost_time >= boost_end_time:
		Globalscript.health_boosted = false
		boost_time = 0.0
		self.queue_free()
func _on_area_entered(area:Area2D):
	if area.is_in_group("Player"):
		player = area
		Globalscript.health_boosted = true
		self.visible = false
	player = null