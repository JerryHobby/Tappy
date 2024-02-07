extends Control
@onready var score_label = $MarginContainer/ScoreLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_score_changed.connect(on_score_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#score_label.text = str(ScoreManager.get_score())
	pass


func on_score_changed():
	score_label.text = str(ScoreManager.get_score())



