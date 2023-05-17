extends Node

var bounceCount = 0
var leftScore = 0
var rightScore = 0
var highScore = 0
var prevHighScore
var saveData = {}

func _ready() -> void:
	prevHighScore = SaveNLoad.loadSave()
	print("global ready func "+ str(prevHighScore))

func _process(_delta: float) -> void:
	if prevHighScore["High Score"] < highScore:
		SaveNLoad.changeSave()
		prevHighScore = SaveNLoad.loadSave()
