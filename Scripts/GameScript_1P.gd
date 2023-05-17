extends Node2D

onready var leftScore = $"Left Score"
onready var rightScore = $"Right Score"
onready var highScore = $"High Score"

func _on_Left_ScoreChange() -> void:
	rightScore.text = str(Globals.rightScore)

func _process(delta: float) -> void:
	highScore.text = "HighScore - " + str(Globals.prevHighScore["High Score"])

func _on_Right_ScoreChange() -> void:
	leftScore.text = str(Globals.leftScore) + " -"
