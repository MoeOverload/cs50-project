extends Label



func _process(_delta):
	self.text = ("MOST KILLS: ") + str(Globalscript.most_kills)