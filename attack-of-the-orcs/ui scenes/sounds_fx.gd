extends Control
@onready var bus_layout = $/default_bus_layout.tres


func _on_backbutton_button_up() -> void:
	get_tree().change_scene_to_file("res://ui scenes/settings_menu.tscn")


func _on_check_button_toggled() :
	pass 
	
	bus_layout.audio
