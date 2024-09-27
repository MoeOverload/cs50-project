extends Label



func _process(_delta):
	#update the score label with the global score value
	self.text = ("SCORE :") + str(Globalscript.score)