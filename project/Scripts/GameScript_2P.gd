extends Node2D

onready var leftScore = $"Left Score"
onready var rightScore = $"Right Score"

func _on_Left_ScoreChange() -> void:
	rightScore.text = str(Globals.rightScore)

func _on_Right_ScoreChange() -> void:
	leftScore.text = str(Globals.leftScore) + " -"
