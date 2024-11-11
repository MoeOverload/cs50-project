extends Node
var health_boost = null
var damage_boost = null
var rain_boost = null
var rapid_boost = null
var crime_boost = null

func _on_area_2d_area_entered(area:Area2D):
	if area.is_in_group("barrier_health_boost"):
		health_boost = area
		health_boost.queue_free()
	health_boost = null
	if area.is_in_group("speed_boost"):
		damage_boost = area
		damage_boost.queue_free()
	damage_boost = null
	if area.is_in_group("raing_boost"):
		rain_boost = area
		rain_boost.queue_free()
	rain_boost = null
	if area.is_in_group("rapid_boost"):
		rapid_boost = area
		rapid_boost.queue_free()
	rapid_boost = null
	if area.is_in_group("war_crime_boost"):
		crime_boost = area 
		crime_boost.queue_free()
	crime_boost = null