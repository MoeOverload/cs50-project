extends PanelContainer

func _process(_delta):
	if Globalscript.raining_arrows == true:
		self.visible = true
	else:
		self.visible = false