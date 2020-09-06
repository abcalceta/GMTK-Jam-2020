extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var kinematic = $KinematicBody2D
onready var sprite = $KinematicBody2D/icon
onready var sound = $KinematicBody2D/AudioStreamPlayer2D
onready var startStop = $KinematicBody2D/startStop

signal batteryDead
signal hullDead

var battery = 100
var hull = 100

var repeats = 0
var prev = null
var isGoing = false
var directionAngle = (randi()%4)*90
var directionVector = Vector2(cos(deg2rad(directionAngle)),sin(deg2rad(directionAngle)))

var slowSpeed = 10
var fastSpeed = 20
var speed = fastSpeed

var accel = 1
var deccel = 10

var movementVec = Vector2(0,0)

var nextAngle = getDirectionAngle()

var notStarted = true

var vibrateUp = false

var bounceValue = 1
var bounceBack = bounceValue

var dead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.rotation_degrees = nextAngle+90
	changeSpriteColor(nextAngle)
	prev = nextAngle
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$KinematicBody2D/Label.text = "NextAngleIs: "+str(nextAngle)
	if Input.is_action_just_pressed("go"):
		if notStarted:
			$BatteryTimer.start()
			notStarted = false
		startStop.stream = load("res://Assets/stop.wav")
		startStop.play()
		sound.play()
		directionAngle = nextAngle
		directionVector = Vector2(cos(deg2rad(directionAngle)),sin(deg2rad(directionAngle)))
		isGoing = true
	if Input.is_action_just_released("go"):
		sound.stop()
		startStop.stream = load("res://Assets/stop.wav")
		startStop.play()
		nextAngle = getDirectionAngle()
		if nextAngle == prev and repeats < 3:
			repeats += 1
		elif nextAngle != prev:
			repeats = 0
			prev = nextAngle
		if repeats >= 3:
			while nextAngle == prev:
				nextAngle = getDirectionAngle()
			prev = nextAngle
			
		changeSpriteColor(nextAngle)
		#accel = baseAccel
		#speed = fastSpeed
		isGoing = false
	
	if Input.is_action_pressed("go"):
		movementVec = lerp(movementVec, directionVector*speed, delta*accel)
		sprite.texture = load("res://Assets/carWhite.png")
	else:
		movementVec = lerp(movementVec, directionVector*0, delta*deccel)
		
	#if bounceBack < bounceValue:
	#	movementVec = -directionVector*speed*0.5
	#	moveInDirection(movementVec)
	#	bounceBack += delta*10
	#	print(bounceBack)
	#else:
	#	moveInDirection(movementVec)
	
	
	if hull <= 0 and not dead:
		emit_signal("hullDead")
	if battery <= 0 and not dead:
		emit_signal("batteryDead")
	if dead:
		battery = lerp(battery, 0, delta*5)
	else:
		moveInDirection(movementVec, delta)
		vibrateSprite(movementVec.length(), delta)
		rotateSprite(directionAngle, delta)
	pass

func moveInDirection(vector, delta):
	var collision = kinematic.move_and_collide(vector, delta)
	if collision:
		movementVec = vector.bounce(collision.normal).normalized()*speed*0.2

func getDirectionAngle():
	
	return (randi()%4)*90






func vibrateSprite(amount, delta):
	amount = amount * 20.5
	if vibrateUp and (directionAngle == 180 or directionAngle == 0):
		sprite.position = lerp(sprite.position, Vector2(0,amount), delta)
	elif !vibrateUp and (directionAngle == 180 or directionAngle == 0):
		sprite.position = lerp(sprite.position, Vector2(0,-amount), delta)	
	elif vibrateUp and (directionAngle == 90 or directionAngle == 270):
		sprite.position = lerp(sprite.position, Vector2(amount,0), delta)
	elif !vibrateUp and (directionAngle == 90 or directionAngle == 270):
		sprite.position = lerp(sprite.position, Vector2(-amount,0), delta)
		
	var vibrate = 2
	if abs(sprite.position.y) >= vibrate:
		vibrateUp = !vibrateUp
	elif abs(sprite.position.x) >= vibrate:
		vibrateUp = !vibrateUp
	
func rotateSprite(direction, delta):
	direction += 90
	sprite.rotation_degrees = lerp(sprite.rotation_degrees, direction, 10*delta)
	$KinematicBody2D/CollisionShape2D.rotation_degrees = lerp(sprite.rotation_degrees, direction, 10*delta)
func changeSpriteColor(angle):
	if angle == 0:
		sprite.texture = load("res://Assets/carYellow.png")
	elif angle == 90:
		sprite.texture = load("res://Assets/carOrange.png")
	elif angle == 180:
		sprite.texture = load("res://Assets/carPurple.png")
	elif angle == 270:
		sprite.texture = load("res://Assets/carBlue.png")

func _on_BatteryTimer_timeout():
	battery -= 0.1
	#print(battery)
	pass # Replace with function body.

func hurt():
	#print("hurt")
	$KinematicBody2D/crash.play()
	hull -= rand_range(5,10)
	bounceBack = 0
	
func zapped():
	$KinematicBody2D/zap.play()
	
func playerDie():
	dead = true
	#get_tree().reload_current_scene()
	pass
	
func _on_zap_finished():
	if dead:
		get_tree().reload_current_scene()
		
	pass # Replace with function body.


func iced(val):
	if val:
		accel = 0.5
		deccel = 1
	else:
		accel = 1
		deccel = 10


func _on_Character_batteryDead():
	dead = true
	$KinematicBody2D/zap.play()
	pass # Replace with function body.


func _on_Character_hullDead():
	dead = true
	$KinematicBody2D/zap.play()
	pass # Replace with function body.
