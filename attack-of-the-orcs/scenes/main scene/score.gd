extends Label
@onready var mainscene = $"../.."

func _process(_delta):
    self.text = "Score: " + str(mainscene.score)