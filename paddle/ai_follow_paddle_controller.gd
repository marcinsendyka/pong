class_name AiFollowPaddleController extends PaddleController

var direction: Vector2
var ball: Node2D
var precision_threshold = 20


func _process(_delta: float) -> void:
	_change_direction()


func new_ball(b: Node2D) -> void:
	ball = b


func is_up() -> bool:
	return direction == Vector2.UP


func is_down() -> bool:
	return direction == Vector2.DOWN


func get_axis() -> float:
	if is_up():
		return -1.0
	elif is_down():
		return 1.0
	else:
		return 0.0


func _change_direction() -> void:
	if ball:
		var dir: Vector2 = ball.direction
		if dir.x > 0:
			if ball.global_position.y < global_position.y - precision_threshold:
				direction = Vector2.UP
			elif ball.global_position.y > global_position.y + precision_threshold:
				direction = Vector2.DOWN
			else:
				direction = Vector2.ZERO
		else:
			direction = Vector2.ZERO
