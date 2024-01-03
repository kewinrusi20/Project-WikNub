extends Sprite2D

const X_START: int = -40
const Y_START: int = 90
var position_new: Vector2 = Vector2(X_START, Y_START)

const SPEED: float = 2



func _ready():
	position = position_new


func _process(delta):
	position_new.x += SPEED
	position = position_new
	
	
	if position_new.x >= (320 + 40):
		position_new.x = X_START
