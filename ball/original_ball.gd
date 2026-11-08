extends Area2D

const MAX_SPEED = 800

@export
var direction = Vector2.LEFT
@export
var curve: Curve

var speed = 200
var speed_increment_on_bounce = 25
var bounce: float = 1.0
@onready var bounce_on_paddle_player: AudioStreamPlayer2D = $BounceOnPaddlePlayer
@onready var bounce_on_wall_player: AudioStreamPlayer2D = $BounceOnWallPlayer


func _physics_process(delta) -> void:
	position += direction * delta * speed


func _on_area_entered(area: Area2D) -> void:
	_bounce(area)


func _on_body_entered(body: Node2D) -> void:
	_bounce(body)


func _bounce(collider: Node2D) -> void:
	var vec: Vector2
	if collider.is_in_group("walls"):
		bounce_on_wall_player.play()
		vec = direction * Vector2(1, -1)
	elif collider.is_in_group("paddle"):
		bounce_on_paddle_player.play()
		var angle = randf() * 2 - 1
		vec = Vector2(direction.x * -1, angle)
		speed = _easing_curve()
		bounce += 1.0
		collider.bounce()
	elif collider.is_in_group("goal"):
		pass  # expected, noop
	else:
		push_warning("unhandled collision")
	direction = vec.normalized()


func _easing_curve() -> int:
	return clamp(curve.sample_baked(bounce), 0, MAX_SPEED)


func _easing_speed() -> int:
	var easing = ease(bounce / 25.0, 0.6)
	return clamp(remap(easing, 0.0, 1.0, 300.0, 1000.0), 0, MAX_SPEED)
