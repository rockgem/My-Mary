extends KinematicBody2D

var jumping
var isOnGround
var moveSpeed = 300
var jumpForce = 900
var velocity = Vector2.ZERO
var gravity = 40

func _ready():
	pass

func _physics_process(delta):
	
	if velocity.y != 0:
		jumping = true
		isOnGround = false
	else:
		jumping = false
		isOnGround = true
	
	velocity.y += gravity
	
	if Input.is_action_just_pressed("ui_up") && !jumping:
		velocity.y = -jumpForce
	if Input.is_action_pressed("ui_left"):
		velocity.x = -moveSpeed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = moveSpeed
	else:
		velocity.x = 0
	
	velocity = move_and_slide(velocity)


func playerTalkRange():
	$Button.show()

func playerTalkRangeFalse():
	$Button.hide()
