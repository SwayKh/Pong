extends Area2D

export var _bounce_direction_y = 1

func _on_Down_area_entered(area: Area2D) -> void:
	if area.name == "ball":
		Sounds.play("Bounce")
		Globals.bounceCount += 1
		area.increaseSpeed()
#		print(Globals.bounceCount)
		area.direction = (area.direction + Vector2(0, _bounce_direction_y)).normalized()


func _on_Up_area_entered(area: Area2D) -> void:
	if area.name == "ball":
		Sounds.play("Bounce")
		Globals.bounceCount += 1
		area.increaseSpeed()
#		print(Globals.bounceCount)
		area.direction = (area.direction + Vector2(0, _bounce_direction_y)).normalized()

