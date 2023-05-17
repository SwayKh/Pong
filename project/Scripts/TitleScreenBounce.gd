extends Node2D

export var _bounce_direction = 1

func _on_Down_area_entered(area: Area2D) -> void:
	if area.name == "ball":
		randomize()
		Sounds.play("Bounce")
		Globals.bounceCount += 1
		area.increaseSpeed()
#		print(Globals.bounceCount)
		area.direction.x = rand_range(-1, 1)
		area.direction.y = -area.direction.y
#		area.direction = Vector2(randf() * 2 + 1, -randf() * 2 - 1).normalized()


func _on_Up_area_entered(area: Area2D) -> void:
	if area.name == "ball":
		randomize()
		Sounds.play("Bounce")
		Globals.bounceCount += 1
		area.increaseSpeed()
#		print(Globals.bounceCount)
		area.direction.x = rand_range(-1, 1)
		area.direction.y = -area.direction.y


func _on_Left_area_entered(area: Area2D) -> void:
	if area.name == "ball":
		randomize()
		Sounds.play("Bounce")
		Globals.bounceCount += 1
		area.increaseSpeed()
#		print(Globals.bounceCount)
#		area.rotation_degrees = rand_range(-180, -180)
		area.direction.x = -area.direction.x
		area.direction.y = rand_range(-1, 1)


func _on_Right_area_entered(area: Area2D) -> void:
	if area.name == "ball":
		randomize()
		Sounds.play("Bounce")
		Globals.bounceCount += 1
		area.increaseSpeed()
#		print(Globals.bounceCount)
		area.direction.x = -area.direction.x
		area.direction.y = rand_range(-1, 1)
