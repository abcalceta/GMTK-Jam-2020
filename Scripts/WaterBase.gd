extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal death

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.get_parent().name == "Character":
		body.get_parent().zapped()
		emit_signal("death")
		#get_tree().reload_current_scene()
