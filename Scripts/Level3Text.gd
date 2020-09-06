extends "res://Scripts/LevelTextHandling.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	texts = [
		"That was a little tricky... but the map says the next cave is even trickier!",
		"It's a smaller cave with more flooding...",
		"I should use a gentle touch sometimes, so that I can switch directions easily.",
		"Alright, this is cave number four! Let's go!"
		]
	globals.level = 4
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
