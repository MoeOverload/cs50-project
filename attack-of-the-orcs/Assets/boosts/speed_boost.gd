extends Area2D
#boost move speed
var speed = 100
var rotation_speed = 3
var player_body = null
var boost_end_time = 2.0
var boost_time = 0.0


func _process(delta):
	position.x -= speed * delta
	rotation += rotation_speed * delta
	if Globalscript.speed_boosted == true:
		boost_time += delta
	if boost_time >= boost_end_time:
		Globalscript.speed_boosted = false
		boost_time = 0.0
		self.queue_free()


		
func _on_area_entered(area):
	if area.is_in_group("Player"):
		player_body = area
		Globalscript.speed_boosted = true
		self.visible = false
	player_body = null
