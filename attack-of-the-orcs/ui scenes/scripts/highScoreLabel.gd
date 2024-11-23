extends Label

func _process(_delta):
	self.text = ("HIGH SCORE : ") + str(Globalscript.new_high_score)