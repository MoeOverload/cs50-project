extends PanelContainer

func _process(_delta):
	if Globalscript.war_crimed == true:
		self.visible = true
	else:
		self.visible = false
