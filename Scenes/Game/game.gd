extends Node2D
@export var pipes_scene: PackedScene
@onready var pipes_holder = $PipesHolder
@onready var spawn_u = $SpawnU
@onready var spawn_l = $SpawnL
@onready var spawn_timer = $SpawnTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_timer.wait_time = GameManager.SPAWN_TIME
	ScoreManager.reset_score()
	SignalManager.on_plane_died.connect(on_plane_died)
	spawn_pipes()
	spawn_timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func spawn_pipes() -> void:
	var newPipes = pipes_scene.instantiate()
	var y_pos = randf_range(
		spawn_u.position.y, 
		spawn_l.position.y)
		
	spawn_u.position.x = get_viewport_rect().size.x + 100
	newPipes.position = Vector2(spawn_u.position.x, y_pos)
	pipes_holder.add_child(newPipes)
	
	if spawn_timer.wait_time > GameManager.SPAWN_TIME_MIN:
		spawn_timer.wait_time -= GameManager.SPAWN_TIME_DEC


func stop_pipes():
	spawn_timer.stop()
	for pipe in pipes_holder.get_children():
		pipe.set_process(false)


func _on_spawn_timer_timeout():
	spawn_pipes()


func on_plane_died():
	stop_pipes()
