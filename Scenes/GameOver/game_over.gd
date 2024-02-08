extends Control
@onready var game_over_label = $GameOverLabel
@onready var press_space_label = $PressSpaceLabel
@onready var timer = $Timer
@onready var game_over_sound = $GameOverSound


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	SignalManager.on_plane_died.connect(on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if press_space_label.visible \
	and Input.is_action_just_pressed(GameManager.KB_CONTINUE):
		GameManager.load_main_scene()


func on_plane_died():
	show()
	game_over_sound.play()
	timer.start()


func switch_labels():
	game_over_label.hide()
	press_space_label.show()


func _on_timer_timeout():
	switch_labels()
