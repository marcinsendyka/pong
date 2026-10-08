extends Area2D

const MAX_SPEED = 1000

var speed = 300
var speed_increment_on_bounce = 25

@export
var direction = Vector2.LEFT

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
		speed = clampi(speed + speed_increment_on_bounce, 0, MAX_SPEED)
	else:
		push_warning("unhandled collision")
	direction = vec.normalized()
