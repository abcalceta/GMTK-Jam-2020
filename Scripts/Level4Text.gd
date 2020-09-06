extends "res://Scripts/LevelTextHandling.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	texts = [
	"The next cave makes me feel claustrophobic... It's so narrow!",
	"There's a little bit of flooding, but the main problem here is the width.",
	"I need to know what the colors mean and use that to my advantage.",
	"Here I go!",
	]
	globals.level = 5
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
