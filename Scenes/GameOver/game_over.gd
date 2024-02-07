extends Control
@onready var score_label = $ScoreLabel
@onready var game_over_label = $GameOverLabel
@onready var press_space_label = $PressSpaceLabel
@onready var timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	SignalManager.on_plane_died.connect(on_plane_died)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Input.is_action_just_pressed("fly"):
		if visible:
			GameManager.load_main_scene()


func on_plane_died():
	score_label.text = str(ScoreManager.get_score())
	show()
	timer.start()


func switch_labels():
	game_over_label.hide()
	press_space_label.show()


func _on_timer_timeout():
	switch_labels()
