extends Area2D
#boost move speed
var speed = 75
var rotation_speed = 3
var player_body = null
var boost_end_time = 8.0
var boost_time = 0.0

func _ready():
	$spawn_sound.playing = true

func _process(delta):
	position.x -= speed * delta
	rotation += rotation_speed * delta
	if Globalscript.double_points == true:
		boost_time += delta
	if boost_time >= boost_end_time:
		Globalscript.double_points= false
		boost_time = 0.0
		self.queue_free()


		
func _on_area_entered(area):
	
	if area.is_in_group("Player"):
		player_body = area
		$pickup_sound.playing = true
		Globalscript.double_points = true
		self.visible = false
	
	player_body = null
