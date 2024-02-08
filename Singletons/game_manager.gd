extends Node

# general constants
const GROUP_PLAYER: String = "player"

# difficulty constants
const SCROLL_SPEED: float = 120.0
const GRAVITY: float = 1500
const POWER: float = -475

const SPAWN_TIME: float = 2.0
const SPAWN_TIME_MIN: float = 1.25
const SPAWN_TIME_DEC: float = 0.05

# keyboard map
const KB_FLY: String = "spacebar"
const KB_CONTINUE: String = "spacebar"
const KB_RESET: String = "reset"
const KB_GODMODE: String = "godmode"

# scenes
const main_scene:PackedScene = preload("res://Scenes/Main/main.tscn")
const game_scene:PackedScene = preload("res://Scenes/Game/game.tscn")
const game_over_scene = preload("res://Scenes/GameOver/game_over.tscn")

var _god_mode:bool = false

func load_game_scene() -> void:
	get_tree().change_scene_to_packed(game_scene)
	
func load_main_scene() -> void:
	get_tree().change_scene_to_packed(main_scene)
	
func load_game_over_scene() -> void:
	get_tree().change_scene_to_packed(game_over_scene)

func set_god_mode(enable: bool) -> void:
	_god_mode = enable;
	SignalManager.on_god_mode.emit()
	
func get_god_mode() -> bool:
	return _god_mode;


