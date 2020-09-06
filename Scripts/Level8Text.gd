extends "res://Scripts/LevelTextHandling.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	texts = [
	"I finally got all the machines to their docks. They'll automatically repair...",
	"I was really worried for a bit, since I thought I'd have to get those machines replaced...",
	"But with hard work, I was able to get the machines back to their repair docks!",
	"Everything is finally...",
	"...Under control.",
	"END.",
	"Thanks for playing!"
	]
	globals.level = 9
