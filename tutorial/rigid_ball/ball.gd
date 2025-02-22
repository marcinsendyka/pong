extends RigidBody2D

@export
var initial_impulse_vector: Vector2 = Vector2(0, 0) # it can be set from the Inspector to test different options for initial force

func _ready() -> void:
	apply_central_impulse(initial_impulse_vector)
