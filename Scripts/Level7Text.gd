extends "res://Scripts/LevelTextHandling.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	texts = [
	"Here's the final machine!",
	"This cave is a bit crazy. It's got ice, flooding, rocks, and a strange shape!",
	"This'll be tricky, but I'll do my best...",
	"One more, and I'm done!"
	]
	globals.level = 8
