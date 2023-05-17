extends Area2D

const DEFAULT_SPEED = 100

var direction = Vector2.LEFT

onready var _initial_pos = position
onready var _speed = DEFAULT_SPEED

func _process(delta):
	_speed += delta * 2
	position += _speed * delta * direction

func increaseSpeed():
	if (Globals.bounceCount % 2 == 0):
		_speed += 5
		Globals.bounceCount += 1

func reset(direc):
	Globals.bounceCount = 0
	direction = direc
	position = _initial_pos
	_speed = DEFAULT_SPEED
