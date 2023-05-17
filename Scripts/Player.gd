extends KinematicBody2D


var _speed = Vector2(0 ,150)
var velocity = Vector2.ZERO
var ballDirection
var _down
var _up
var offset = Vector2.ZERO
var touchPos = Vector2(0, 90)
onready var screenSizeY = get_viewport_rect().size.y
onready var n = name.to_lower()

func _ready() -> void:
#	print(transform.x)
#	print(transform.y)
	_up = n + "_UP"
	_down = n + "_Down"
	ballDirection = 1 if n == "left" else -1
	if n == "left":
		position = Vector2(16, 90)
	elif n == "right":
		position = Vector2(304, 90)

func touchControl(delta, touchPos):
	if n == "left":
		position.y =  touchPos.y
	elif n == "right":
		position.y = touchPos.y

func _physics_process(delta: float) -> void:
	touchControl(delta, touchPos)
	var input = Input.get_action_strength(_down) - Input.get_action_strength(_up)
	position.y = clamp(position.y + input * _speed.y * delta, 16, screenSizeY - 16)


func _on_Area2D_area_entered(area: Area2D) -> void:
	if area.name == "ball":
		# Assign new direction.
		Sounds.play("Bounce")
		Globals.bounceCount += 1
		area.increaseSpeed()
		area.direction = Vector2(ballDirection, randf() * 2 - 1).normalized()


func _on_TouchArea_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventScreenDrag:
		touchPos = event.position
