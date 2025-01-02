extends Area2D
var speed = 75
var rotation_speed = 3
var boost_end_time = 6.0
var boost_time = 0.0
var player = null

func _ready():
	$spawn_sound.playing = true
func _process(delta):
	position.x -= speed * delta
	rotation += rotation_speed * delta
	if Globalscript.war_crimed == true:
		boost_time += delta
	if boost_time >= boost_end_time:
		Globalscript.war_crimed = false
		boost_time = 0.0
		self.queue_free()

func _on_area_entered(area:Area2D):
	if area.is_in_group("Player"):
		player = area
		$pickup_sound.playing = true
		Globalscript.war_crimed = true
		self.visible = false
	player = null
