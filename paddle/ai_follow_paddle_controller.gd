class_name AiFollowPaddleController extends PaddleController

var direction: Vector2
var ball: Node2D
var precision_threshold = 20

func new_ball(b: Node2D) -> void:
	ball = b

func _process(_delta: float) -> void:
	_change_direction()

func is_up() -> bool:
	return direction == Vector2.UP

func is_down() -> bool:
	return direction == Vector2.DOWN

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
