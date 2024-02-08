extends Node

func _ready():
	SignalManager.load_game_data.connect(load_game_data)
	SignalManager.save_game_data.connect(save_game_data)

func save_game_data() -> void:
	
	# put the fields in object
	var data := {
		"highScore": ScoreManager.get_high_score()
	}
	
	var save_file = FileAccess.open("saveFile", FileAccess.WRITE) # Open File
	save_file.store_line(JSON.stringify(data))
	save_file.close() # Close File


func load_game_data() -> void:
	# Check if the SaveFile exists
	if !FileAccess.file_exists("saveFile"):
		print("Error, no Save File to load.")
		return
		
	var save_file = FileAccess.open("saveFile", FileAccess.READ) # Open File
	
	while save_file.get_position() < save_file.get_length():
		# Get the saved dictionary from the next line in the save file
		var json = JSON.new()
		json.parse(save_file.get_line())
		
		# Get the Data
		var data = json.get_data()
		
		# pull the fields
		ScoreManager.set_high_score(data["highScore"])

	save_file.close() # Close File
