extends "res://Scripts/LevelTextHandling.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	texts = [
	"This cave has such a weird shape! It's diagonal!",
	"There's flooding, and there's ice, and there are rocks... Great.",
	"This is the second to the last cave, though, so I just have to hang on and get it done!",
	"I'll do my best this time. Here I go!",
	]
	globals.level = 7
