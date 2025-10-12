extends CharacterBody2D

@export var speed: float = 2048
@export var player: int = 0

func _physics_process(delta: float) -> void:
	velocity -= velocity * delta * 5.0
	if player == 0:
		if Input.is_action_pressed("ui_up"):
			velocity.y -= speed * delta
		if Input.is_action_pressed("ui_down"):
			velocity.y += speed * delta
	if player == 1:
		if Input.is_action_pressed("ui_home"):
			velocity.y -= speed * delta
		if Input.is_action_pressed("ui_end"):
			velocity.y += speed * delta
			
	move_and_slide()
