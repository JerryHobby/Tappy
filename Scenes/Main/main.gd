extends Control
@onready var high_score = $MarginContainer/HighScore


# Called when the node enters the scene tree for the first time.
func _ready():
	high_score.text = str(ScoreManager.get_high_score())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed(GameManager.KB_CONTINUE):
		GameManager.load_game_scene()

