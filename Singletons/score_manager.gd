extends Node

enum {UNIT_NEUTRAL, UNIT_ENEMY, UNIT_ALLY}
enum Named {THING_1, THING_2, ANOTHER_THING = -1}

# syntax 1
var _high_score:int = 0: 
	get: return _high_score
	set(score): 
		_high_score = score
		SignalManager.on_high_score_changed.emit()
		print("New High Score:", _high_score)


# syntax 2
var _score:int = 0: 
	get = get_score, set = set_score


func get_score() -> int:
	return _score


func get_high_score() -> int:
	return _high_score


func set_score(score:int) -> void:
	_score = score
	SignalManager.on_score_changed.emit()
	
	if _score > _high_score:
		_high_score = _score


func increment_score():
	_score += 1


func reset_score():
	_score = 0
