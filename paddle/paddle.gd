class_name Paddle extends CharacterBody2D

@export var speed: float = 2048
@export var player: int = 0
@export var pc: PaddleController: 
	set(val):
		pc = val
		pc.position = $Middle.position

func _physics_process(delta: float) -> void:
	velocity -= velocity * delta * 10.0
	var input = pc.get_axis()
	velocity.y += speed * delta * input
	move_and_slide()

func bounce() -> void:
	Input.start_joy_vibration(player, 0.5, 0.1, 0.1)
