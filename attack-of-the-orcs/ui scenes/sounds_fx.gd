extends Control
@onready var bus_layout = "res://default_bus_layout.tres"



func _on_backbutton_button_up() -> void:
	get_tree().change_scene_to_file("res://ui scenes/settings_menu.tscn")


#master volume control
func _on_check_button_toggled(toggled_on: bool):
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), toggled_on)
	
	
#music mute cntrol
func _on_musicmute_toggled(toggled_on: bool):
	AudioServer.set_bus_mute(AudioServer.get_bus_index("music"), toggled_on)

#sound fx control
func _on_soundfx_mute_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(AudioServer.get_bus_index("fx"), toggled_on)
