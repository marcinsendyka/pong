extends Node2D

@export var speed: float = 2048

var velocity = Vector2(0,0)

func _physics_process(delta: float) -> void:
	velocity -= velocity * delta * 5.0
	if Input.is_action_pressed("ui_up"):
		velocity.y -= speed * delta
	if Input.is_action_pressed("ui_down"):
		velocity.y += speed * delta

	position += velocity * delta
