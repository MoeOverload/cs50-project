extends PanelContainer

func _process(_delta):
	if Globalscript.speed_boosted == true:
		self.visible = true 
	else:
		self.visible = false