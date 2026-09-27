extends Node2D

@export
var ball_scene: PackedScene
@export
var hud: CanvasLayer

var current_ball: Area2D 
var score_player_1: int = 0
var score_player_2: int = 0

func _ready() -> void:
	if not hud:
		push_error("hud not set")
	else:
		await hud.countdown_finished
	create_ball()

func _on_left_goal_body_entered(_body: Node2D) -> void:
	_left_goal()

func _on_right_goal_body_entered(_body: Node2D) -> void:
	_right_goal()
	
func _on_left_goal_area_entered(_area: Area2D) -> void:
	_left_goal()

func _on_right_goal_area_entered(_area: Area2D) -> void:
	_right_goal()

func _right_goal() -> void:
	_reset_ball()
	score_player_1 += 1
	hud.set_player1_score(score_player_1)
	
func _left_goal() -> void:
	_reset_ball()
	score_player_2 += 1
	hud.set_player2_score(score_player_2)

func _reset_ball() -> void:
	current_ball.queue_free() 
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
