extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal dieLevel

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	for g in get_tree().get_nodes_in_group("water"):
		g.connect("death", self, "playerDie")
	for g in get_tree().get_nodes_in_group("rock"):
		g.connect("hurt", self, "playerHurt")
	$Character.connect("batteryDead", self, "playerDie")
	$Character.connect("hullDead", self, "playerDie")
	connect("dieLevel", $Character, "playerDie")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func playerDie():
	#print("player DIes")
	emit_signal("dieLevel")
	$GUI.flash()
	pass

func playerHurt():
	$Character.hurt()
