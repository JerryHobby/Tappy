extends Node

enum {UNIT_NEUTRAL, UNIT_ENEMY, UNIT_ALLY}
enum Named {THING_1, THING_2, ANOTHER_THING = -1}

var _high_score:int = 0
var _score:int = 0

func get_high_score() -> int:
	# reset_high_score()
	return _high_score


func set_high_score(score) -> void:
	_high_score = score
	print("High score:", score)
	SignalManager.on_high_score_changed.emit()
	SignalManager.save_game_data.emit()


func reset_high_score() -> void:
	set_high_score(0)


func get_score() -> int:
	return _score


func set_score(score:int) -> void:
	_score = score
	SignalManager.on_score_changed.emit()
	
	if _score > get_high_score():
		set_high_score(_score)


func increment_score():
	set_score(_score + 1)


func reset_score():
	set_score(0)

