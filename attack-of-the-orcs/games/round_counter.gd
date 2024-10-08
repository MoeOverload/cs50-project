extends Label



func _process(_delta):
	self.text = ("ROUND :") + str(Globalscript.rounds_counter)