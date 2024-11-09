extends Area2D
var speed = 100
var rotation_speed = 3
var boost_end_time = 1.8
var boost_time = 0.0
var player = null
func _process(delta):
	position.x -= speed * delta
	rotation += rotation_speed * delta
	if Globalscript.war_crimed == true:
		boost_time += delta
	if boost_time >= boost_end_time and Globalscript.crime_cooldown == true:
		Globalscript.war_crimed = false
		boost_time = 0.0
		self.queue_free()
func _on_area_entered(area:Area2D):
	if area.is_in_group("Player"):
		player = area
		Globalscript.war_crimed = true
		print("war crime")
		self.visible = false
	player = null


