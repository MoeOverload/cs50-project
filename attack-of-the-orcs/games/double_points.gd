extends PanelContainer




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Globalscript.double_points == true:
		self.visible = true
	else:
		self.visible = false
