extends CharacterBody2D

const SPEED = 300.0

func _ready() -> void:
	velocity = Vector2(SPEED, 0)

func _physics_process(delta: float) -> void:
	var collision_info: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
		var collider_velocity = collision_info.get_collider_velocity().normalized()
		if collider_velocity.y != 0:
			velocity.y = velocity.y + 100 * collider_velocity.y
