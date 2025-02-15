extends RigidBody2D

var random_multiplier: Array = [-1, 1]

func _ready() -> void:
	apply_central_impulse(initial_random_force())
	
func _on_body_entered(_body) -> void:
	if linear_velocity.length() < 500:
		apply_central_impulse(linear_velocity.normalized() * 82)
	if linear_velocity.normalized().y > 0.95:
		var multiplier
		if linear_velocity.x > 0:
			multiplier = 1
		else:
			multiplier = -1
		apply_central_impulse(Vector2(multiplier * 100, 0))

func initial_random_force() -> Vector2:
	return Vector2(random_multiplier.pick_random() * 450, randfn(0, 100))
