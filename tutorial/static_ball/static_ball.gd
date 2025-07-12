extends StaticBody2D

const speed: int = 1
var direction: Vector2 = Vector2(100, 0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	position.x += direction.x * speed * delta
	position.y += direction.y * speed * delta

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	print_debug(event)
