extends Label


func _process(_delta):
	self.text = ("HIGHEST ROUND: ") + str(Globalscript.highest_round)