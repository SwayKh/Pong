extends KinematicBody2D

onready var ball = get_node("/root/GameScene/ball")
onready var screenSizeY = get_viewport_rect().size.y
var speed = Vector2(0, 150)
var direction = Vector2.ZERO
var velocity = Vector2.ZERO
var ballDirection

func _ready():
	ballDirection = 1
	position = Vector2(16, 90)

func _physics_process(delta):
	var y_dist = sqrt(pow(ball.position.y - position.y, 2))

	if y_dist < (speed.y * delta):
		# not  far enough away to move
		direction = Vector2.ZERO
	elif ball.position.y > position.y:
		# far enough to move and ball below the paddle
		direction = Vector2.DOWN
	elif ball.position.y < position.y:
		# far enough to move and ball above the paddle
		direction = Vector2.UP

	position.y = clamp(position.y, 16, screenSizeY - 16)
	velocity = speed * direction
	if ball.position.x < get_viewport_rect().size.x/1.5:
		move_and_slide(velocity)


func _on_Area2D_area_entered(area: Area2D) -> void:
	if area.name == "ball":
		# Assign new direction.
		Sounds.play("Bounce")
		Globals.bounceCount += 1
		area.increaseSpeed()
		area.direction = Vector2(ballDirection, randf() * 2 - 1).normalized()
