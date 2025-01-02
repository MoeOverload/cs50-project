extends Area2D
#boost move speed
var speed = 75
var rotation_speed = 3
var player = null
var boost_end_time = 4.0
var boost_time = 0.0
func _ready():
	$spawn_sound.playing = true
func _process(delta):
	position.x -= speed * delta
	rotation += rotation_speed * delta
	if Globalscript.rapid_fire_boosted == true:
		boost_time += delta
	if boost_time >= boost_end_time:
		Globalscript.rapid_fire_boosted = false
		boost_time = 0.0
		self.queue_free()

func _on_area_entered(area):
	if area.is_in_group("Player"):
		player = area
		$pickup_sound.playing = true
		Globalscript.rapid_fire_boosted = true
		self.visible = false
		
	player = null
