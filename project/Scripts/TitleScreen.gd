extends Control


func _on_Setting_pressed() -> void:
	Sounds.play("Click")
#	get_tree().change_scene("res://Scenes/GameScene.tscn")


func _on_1P_Play_pressed() -> void:
	Sounds.play("Click")
	get_tree().change_scene("res://Scenes/SinglePlayer.tscn")


func _on_2P_Play_pressed() -> void:
	Sounds.play("Click")
	get_tree().change_scene("res://Scenes/MultiPlayer.tscn")
