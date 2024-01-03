extends Sprite2D

@onready var ball = $"../BlastBlue1"
@onready var man = $"../Man"

var status_hitted: bool = false
var status_game: bool = true
var travel: Vector2
var travel_hipo = 8


func _ready():
	pass


func _process(delta):
	if status_game:
		if status_hitted == false:
			restart_spawn()
			hitbox_check()
			man.move_my_man()
			ball.ball_rotate()
			ball_charge()
			move_baby()
		else:
			if (ball.scale.x <= ball.MAX_SIZE_EXPLOSION) && (man.status_alive == true):
				man.status_alive = ball.ball_explode()
				
			if man.status_alive == false:
				man.get_lost()
				status_game = ball.get_lost()


func ball_charge():
	# ROTATION
	print('speed_rotation: ', ball.speed_rotation)
	print('MAX_SPEED: ', ball.MAX_SPEED)
	if ball.speed_rotation <= ball.MAX_SPEED:
		print('go')
		ball.status_roll = true
		ball.rotate_more_baby()
	else:
		print('wtf')
		ball.status_roll = false
	
	# INCREASE
	if ball.scale.x <= ball.MAX_SIZE:
		ball.status_increase = true
		ball.increase_baby()
	else:
		ball.status_increase = false


func move_baby():
	if ball.status_roll == false && ball.status_increase == false:
		travel = man.position - ball.position
		travel_hipo = abs(sqrt(pow(travel.x, 2) + pow(travel.y, 2)))
		
		ball.position.x += (travel.x / travel_hipo)
		ball.position.y += (travel.y / travel_hipo)

func hitbox_check():
	if travel_hipo <= 7:
		status_hitted = true
		ball.status_explode = true


func restart_spawn():
	if Engine.get_process_frames() % 900 == 0:
		ball.altF4()
