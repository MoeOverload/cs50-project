extends PanelContainer
func _process(_delta):
	if Globalscript.rapid_fire_boosted == true:
		self.visible = true
	else:
		self.visible = false