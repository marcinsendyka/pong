extends Area2D

var speed = 300
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
	else:
		push_warning("unhandled collision")
	direction = vec.normalized()
