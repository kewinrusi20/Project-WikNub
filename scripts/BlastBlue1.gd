extends Sprite2D

var speed_rotation = 0
var status_increase: bool = true
var status_decrease: bool = false
var status_roll: bool = true
var status_explode: bool = false

const MAX_SIZE = 0.03
const MAX_SIZE_EXPLOSION = 0.1
const MAX_SPEED = 15

const X_SPAWN = 199
const Y_SPAWN = 37

@onready var man = $"../Man"


# Called when the node enters the scene tree for the first time.
func _ready():
	Vector2(0.03, 0.03)
	rotation_degrees = 0
	position = Vector2(X_SPAWN,Y_SPAWN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func ball_rotate():
	rotation_degrees += speed_rotation


func increase_baby():
	scale.x += 0.0002
	scale.y += 0.0002
	
	
func rotate_more_baby():
	speed_rotation += 0.2
	print('r')
	

func ball_explode():
	scale.x += 0.003
	scale.y += 0.003
	
	if scale.x >= MAX_SIZE_EXPLOSION: 
		return false
	else: 
		return true


func get_lost():
	if scale.x >= 0:
		scale.x -= 0.007
		scale.y -= 0.007
		return true
	else:
		scale.x = 0
		scale.y = 0
		return false


func altF4():
	scale.x = 0
	scale.y = 0
	
	position.x = X_SPAWN
	position.y = Y_SPAWN
	pass
