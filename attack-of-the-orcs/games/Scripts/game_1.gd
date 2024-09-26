extends Node2D
#score 
var score = 0
#check if game is over
var is_game_over = false

#on game over reset values
func reset_values():
	score=0
	is_game_over = false




func _physics_process(_delta):
	pass