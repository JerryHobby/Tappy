extends Control
@onready var score_label = $ScoreLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	score_label.text = str(ScoreManager.get_score())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Input.is_action_just_pressed("fly"):
		GameManager.load_main_scene()
