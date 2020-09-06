extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if area.get_parent().name == "KinematicBody2D":
		print(globals.level, globals.lastLevel)
		if globals.level == 9:
			get_tree().change_scene("res://Scenes/EndingText.tscn")
		elif globals.level+1 < globals.lastLevel:
			globals.level = (globals.level+1)
			print("res://Scenes/Level"+str(globals.level-1)+"Text.tscn")
			get_tree().change_scene("res://Scenes/Level"+str(globals.level-1)+"Text.tscn")
		else:
			get_tree().change_scene("res://Scenes/EndingText.tscn")
