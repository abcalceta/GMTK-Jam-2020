extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var character = get_parent().get_node("Character")
# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$GUI/BatteryLevel.value = character.battery
	$GUI/HullLevel.value = character.hull
	pass

func flash():
	$ColorRect.show()
	$AnimationPlayer.play("die")
