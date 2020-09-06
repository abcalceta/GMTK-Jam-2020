extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var curr = 0
var texts = [
	"Oh no, there's something wrong with the remote cave exploring machines!",
	"It seems like the control boxes aren't working...",
	"I can't steer them! They choose a random direction and just move forward with each press!",
	"I can activate it with W, A, S, D, and SPACE, but I can't control the direction anymore...",
	"I have to manually drive them to the repair docks!",
	"They're awfully expensive and I can't afford to lose even one!",
	"There's eight of them in total... Let's do this!"
]

var first = true
# Called when the node enters the scene tree for the first time.
func _ready():
	$RichTextLabel.bbcode_text = texts[0]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if first:
		$RichTextLabel.bbcode_text = texts[0]
		first = false
	if Input.is_action_just_pressed("go"):
		nextText()
	pass

func nextText():
	Blip.play()
	curr+=1
	if curr == texts.size():
		finishedText()
	else:
		$RichTextLabel.bbcode_text = texts[curr]




func finishedText():
	if globals.level != globals.lastLevel:
		get_tree().change_scene("res://Scenes/Level"+str(globals.level)+".tscn")
	else:
		get_tree().change_scene("res://Scenes/MainMenu.tscn")
