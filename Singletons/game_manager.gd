extends Node

# general constants
const GROUP_PLAYER: String = "player"

# difficulty constants
const SCROLL_SPEED: float = 120.0
const GRAVITY: float = 1500
const POWER: float = -500

const SPAWN_TIME: float = 3
const SPAWN_TIME_MIN: float = 1.5
const SPAWN_TIME_DEC: float = 0.05

# scenes
const main_scene:PackedScene = preload("res://Scenes/Main/main.tscn")
const game_scene:PackedScene = preload("res://Scenes/Game/game.tscn")
const game_over_scene = preload("res://Scenes/GameOver/game_over.tscn")

func load_game_scene() -> void:
	get_tree().change_scene_to_packed(game_scene)
	
func load_main_scene() -> void:
	get_tree().change_scene_to_packed(main_scene)
	
func load_game_over_scene() -> void:
	get_tree().change_scene_to_packed(game_over_scene)



