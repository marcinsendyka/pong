extends Node2D

# demo how to spawn ball in the middle of the viewport

@export
var ball_scene: PackedScene

func _ready() -> void:
	var ball_instance = ball_scene.instantiate()
	add_child(ball_instance)
	ball_instance.global_position = Vector2(
		get_viewport().size.x / 2,
		get_viewport().size.y / 2
	)
