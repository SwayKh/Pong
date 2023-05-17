extends Node

var savePath = "user://save.json"
var defaultData = {
	"High Score" : 0,
	}

func _ready() -> void:
	print(loadSave())

func _process(delta: float) -> void:
	if loadSave() == null:
		defaultSave()

func defaultSave():
	var file = File.new()
	var error = file.open(savePath, File.WRITE)
#	var error = file.open_encrypted_with_pass(savePath, File.WRITE, "Fdsa4321")
	if error == OK:
#		file.store_var(defaultData)
		file.store_line(to_json(defaultData))
		file.close()
		print("no error in default save")
	else:
		print("error in default save " + str(error))


func changeSave():
	var data = Globals.saveData
	var file = File.new()
#	var error = file.open_encrypted_with_pass(savePath, File.WRITE, "Fdsa4321")
	var error = file.open(savePath, File.WRITE)
	if error == OK:
#		file.store_var(data)
		file.store_line(to_json(data))
		file.close()
		print("no error in change save")
	else:
		print("error in change save " + error)
	print(Globals.saveData)

func loadSave():
	var file = File.new()
	if file.file_exists(savePath):
#		var error = file.open_encrypted_with_pass(savePath, File.READ, "Fdsa4321")
		var error = file.open(savePath, File.READ)
		if error == OK:
			while(!file.eof_reached()):
				var save = parse_json(file.get_line())
				return save
			file.close()

			print("no error in load save")
		else:
			print("error in load save "+error)
	else:
		print("NO FILE FOUND")
		print("Creating a save file")
		defaultSave()
