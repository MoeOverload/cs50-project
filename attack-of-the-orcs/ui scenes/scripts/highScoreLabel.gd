extends Label

func _process(_delta):
	self.text = ("HIGHSCORE :") + str(Globalscript.new_high_score)