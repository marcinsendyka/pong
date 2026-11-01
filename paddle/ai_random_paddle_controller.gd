class_name AiRandomPaddleController extends PaddleController

var _acc: float = 0.0
var direction: Vector2

func _process(delta: float) -> void:
	_acc += delta
	if _acc > 0.2:
		_acc = 0.0
		_change_direction()
		
func is_up() -> bool:
	return direction == Vector2.UP

func is_down() -> bool:
	return direction == Vector2.DOWN

func _change_direction() -> void:
	var r = randf()
	if r > 0.8:
		direction = Vector2.UP
	elif r > 0.6:
		direction = Vector2.DOWN
	else:
		direction = Vector2.ZERO	
