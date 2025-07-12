extends Node2D

@export
var velocity = Vector2(200,200)

func _physics_process(delta) -> void:
	var collision = move_and_check_collision(global_position, velocity * delta)
	if collision: # handling collision
		var normal = collision.normal
		velocity = velocity.bounce(normal)
	position += velocity * delta # normal movement

func move_and_check_collision(position: Vector2, delta_move: Vector2):
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(position, position + delta_move)
	var result = space_state.intersect_ray(query) # checks if there is body in front of the ball
	if result:
		return result
	return null
