class_name RetroMovement extends Node2D

@export var ticks_per_sec = 8
@export var sprite: Node2D

var _delta_time_start
var _previous_sprite_global_pos: Vector2
var _delta_time

func _ready() -> void:
	_delta_time_start = 1.000 / ticks_per_sec
	_delta_time = _delta_time_start
	_previous_sprite_global_pos = sprite.global_position

func _physics_process(delta: float) -> void:
	_delta_time = _delta_time - delta
	if _delta_time <= 0:
		_delta_time = _delta_time_start
		_previous_sprite_global_pos = global_position

	sprite.global_position = _previous_sprite_global_pos
