extends Node2D

# demo how to spawn ball in the location of other node

@onready
var spawn_location: Node2D = $Spawn

var ball_scene: PackedScene = preload("res://tutorial/ball/character_ball/character_ball.tscn")

func _ready() -> void:
	var ball_instance = ball_scene.instantiate()
	add_child(ball_instance)
	ball_instance.global_position = spawn_location.global_position
