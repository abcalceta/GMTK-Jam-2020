extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal hurt

var entered = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Area2D_body_entered(body):
	if body.get_parent().name == "Character":
		entered = true
		emit_signal("hurt")
		#$Timer.start()
		
func _on_Area2D_body_exited(body):
	if body.get_parent().name == "Character":
		entered = false
		#$Timer.stop()

func _on_Timer_timeout():
	emit_signal("hurt")
