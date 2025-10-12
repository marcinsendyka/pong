extends StaticBody2D

const speed: int = 1
var direction: Vector2 = Vector2(200, 0)

func _process(delta: float) -> void:
	pass
	position.x += direction.x * speed * delta
	position.y += direction.y * speed * delta

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	print_debug(event)
