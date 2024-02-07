extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= delta * GameManager.SCROLL_SPEED


func _on_screen_exited():
	queue_free() # Replace with function body.


func _on_pipe_collision(body):
	if body.is_in_group(GameManager.GROUP_PLAYER):
		body.die()


func _on_laser_body_exited(body):
	if body.is_in_group(GameManager.GROUP_PLAYER):
		ScoreManager.increment_score()

