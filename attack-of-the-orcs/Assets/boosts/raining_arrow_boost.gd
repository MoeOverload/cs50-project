extends Area2D
#boost move speed
var speed = 100
var rotation_speed = 3 
var player = null
var boost_end_time = 6.0
var boost_time = 0.0
func _process(delta):
	position.x -= speed * delta
	rotation += rotation_speed * delta
	if Globalscript.raining_arrows == true:
		boost_time += delta
	if boost_time >= boost_end_time:
		Globalscript.raining_arrows = false
		boost_time = 0.0
		self.queue_free()

func _on_area_entered(area:Area2D):
	if area.is_in_group("Player"):
		player = area
		Globalscript.raining_arrows = true
		self.visible = false
	player = null