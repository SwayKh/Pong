extends Area2D

signal ScoreChange

func _on_Right_area_entered(area: Area2D) -> void:
	if area.name == "ball":
		Sounds.play("BounceOut")
		Globals.leftScore += 1
		#oops, ball went out of game place, reset
		area.reset(Vector2.RIGHT)
		emit_signal("ScoreChange")


func _on_Left_area_entered(area: Area2D) -> void:
	if area.name == "ball":
		Sounds.play("BounceOut")
		Globals.rightScore += 1
		Globals.highScore += 1
		Globals.saveData["High Score"] = Globals.highScore
		#oops, ball went out of game place, reset
		area.reset(Vector2.LEFT)
		emit_signal("ScoreChange")
