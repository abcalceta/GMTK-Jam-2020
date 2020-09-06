extends "res://Scripts/LevelTextHandling.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	texts = [
	"The next cave's also flooded... but what's this?",
	"Ice! Some of the flooding has frozen solid and the machine can just drive over it!",
	"It's going to be really slippery, though...",
	"I won't know how it feels till I try it. Here goes!",
	]
	globals.level = 6
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
