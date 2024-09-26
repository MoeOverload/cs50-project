extends Label
@onready var mainScene = $"../.."



func _process(_delta):
    if mainScene.is_game_over == true:
        self.visible=true 


    if Input.is_action_just_pressed("ui_accept") and mainScene.is_game_over == true:
        get_tree().reload_current_scene()
        mainScene.reset_values()


    #elif Input.is_action_just_pressed("Q") and mainScene.is_game_over == true:
        ##TODO: make a connection back to main hub!
