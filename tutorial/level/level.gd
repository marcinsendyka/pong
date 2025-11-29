extends Node2D

@export
var ball_scene: PackedScene

var current_ball: CharacterBody2D # stored for detecting goal via manual position check and to remove ball instance

func _ready() -> void:
	create_ball()

func  _process(_delta: float) -> void:
	if current_ball != null:
		# manual position checks
		var pos = current_ball.global_position
		if pos.x < get_viewport_rect().position.x:
			print_debug("Left goal code")
		if pos.x > get_viewport_rect().end.x:
			print_debug("Right goal code")	

# signal goal checks - recommended approach
func _on_left_goal_body_entered(_body: Node2D) -> void:
	print_debug("Left goal")
	# respawning ball by teleporting existing instance to the initial position
	current_ball.global_position = get_ball_initial_position()
	current_ball.velocity = Vector2(current_ball.SPEED, 0)

func _on_right_goal_body_entered(_body: Node2D) -> void:
	print_debug("Right goal")
	# respawning ball by removing old one and creating new ball
	current_ball.queue_free() # schedule deletion of current ball Node
	call_deferred("create_ball")

func create_ball() -> void: 
	var ball_instance = ball_scene.instantiate()
	ball_instance.global_position = get_ball_initial_position()
	add_child(ball_instance)
	current_ball = ball_instance
	
func get_ball_initial_position() -> Vector2:
	return Vector2(
		get_viewport().size.x / 2,
		get_viewport().size.y / 2
	)
