extends Area2D

const MAX_SPEED = 1000

var speed = 300
var speed_increment_on_bounce = 25
var bounce: float = 1.0
@export
var direction = Vector2.LEFT

@export 
var curve: Curve

func _physics_process(delta) -> void:
	position += direction * delta * speed
	
func _on_area_entered(area: Area2D) -> void:
	_bounce(area)

func _on_body_entered(body: Node2D) -> void:
	_bounce(body)

func _bounce(collider: Node2D) -> void:
	var vec: Vector2
	if collider.is_in_group("walls"):
		vec = direction * Vector2(1, -1)
	elif collider.is_in_group("paddle"):
		var angle = randf() * 2 - 1
		vec = Vector2(direction.x * -1, angle)
		speed = _easing_curve()
		bounce += 1.0
	else:
		push_warning("unhandled collision")
	direction = vec.normalized()

func _easing_curve() -> int:
	return clamp(curve.sample_baked(bounce), 0, MAX_SPEED)
	
func _easing_speed() -> int:
	var easing = ease(bounce / 25.0, 0.6)
	return clamp(remap(easing, 0.0, 1.0, 300.0, 1000.0), 0 , MAX_SPEED)
