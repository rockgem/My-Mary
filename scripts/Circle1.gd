extends Sprite

var tick = 0.0
var dir = "right"
export(int) var moveSpeed = 50
export(int) var duration = 3

func _ready():
	var random = randi() % 2
	
	match random:
		1: dir = "left"
		2: dir = "right"

func _physics_process(delta):
	tick += delta
	
	if tick >= duration:
		changeDir()
		tick = 0.0
	
	if dir == "left":
		position.x -= moveSpeed * delta
	elif dir == "right":
		position.x += moveSpeed * delta
#	elif dir == "up":
#		position.y -= moveSpeed * delta
#	elif dir == "down":
#		position .y+= moveSpeed * delta
	

func changeDir():
	if dir == "left":
		dir = "right"
	else:
		dir = "left"
	
	
