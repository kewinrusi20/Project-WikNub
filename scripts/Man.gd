extends Sprite2D

var status_alive: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func move_my_man():
	if Input.is_action_pressed("ui_right"):
		position.x += 2
	elif Input.is_action_pressed("ui_left"):
		position.x -= 2
	elif Input.is_action_pressed("ui_down"):
		position.y += 2
	elif Input.is_action_pressed("ui_up"):
		position.y -= 2

func get_lost():
	status_alive = false
	scale.x = 0
	scale.y = 0
