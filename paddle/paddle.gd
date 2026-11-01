class_name Paddle extends CharacterBody2D

@export var speed: float = 2048
@export var player: int = 0
@export var pc: PaddleController: 
	set(val):
		pc = val
		pc.position = $Middle.position

func _physics_process(delta: float) -> void:
	velocity -= velocity * delta * 8.0
	if pc.is_up():
		velocity.y -= speed * delta
	if pc.is_down():
		velocity.y += speed * delta
	move_and_slide()
