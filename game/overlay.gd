class_name Overlay extends Control

const BALL_VELO_PREFIX = "Ball velocity: "

@export var level: Level

func _ready() -> void:
	if not OS.is_debug_build():
		queue_free()

func _process(_delta: float) -> void:
	if level.current_ball and not level.current_ball.is_queued_for_deletion():
		_ball_velocity(level.current_ball.speed)
	else:
		_ball_velocity(0.0)
			
func _ball_velocity(velo: float) -> void:
	%BallVelocity.text = BALL_VELO_PREFIX + str(velo)
