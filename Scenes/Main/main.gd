extends Control
@onready var high_score = $MarginContainer/HighScore


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.load_game_data.emit()
	high_score.text = str(ScoreManager.get_high_score())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed(GameManager.KB_CONTINUE):
		GameManager.load_game_scene()
		
	if Input.is_action_just_pressed(GameManager.KB_RESET):
		ScoreManager.reset_high_score()
		high_score.text = str(ScoreManager.get_high_score())

	if Input.is_action_just_pressed(GameManager.KB_GODMODE):
		GameManager.set_god_mode(!GameManager.get_god_mode())
		
func _on_reset_button_pressed():
	print("Button")
	ScoreManager.reset_high_score()

