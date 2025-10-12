extends Node2D

@export var ball: PackedScene
var current_ball: Node2D
@onready
var left_score_label: Label = $HUD/Control/ScoreLeft
@onready
var right_score_label: Label = $HUD/Control/ScoreRight
@onready
var game_over_label: Label = $HUD/Control/MiddleLabel
@onready
var ball_spawn_timer: Timer = $BallSpawnTimer
var left_score = 0 # Player 1 score
var right_score = 0 # Player 2 score

const LEFT_SCORE_PREFIX: String = "Left: "
const RIGHT_SCORE_PREFIX: String = "Right: "
const SCORE_LIMIT: int = 11

func _ready() -> void:
	start_game()

func _on_left_goal_body_entered(_body: Node2D) -> void:
	right_score += 1
	update_score(right_score, right_score_label, RIGHT_SCORE_PREFIX)
	check_score()
	remove_ball.call_deferred()

func _on_right_goal_body_entered(_body: Node2D) -> void:
	left_score += 1
	update_score(left_score, left_score_label, LEFT_SCORE_PREFIX)
	remove_ball.call_deferred()
	check_score()

func new_ball() -> void:
	var ball_instance = ball.instantiate()
	add_child(ball_instance)
	ball_instance.global_position = Vector2(
		get_viewport().size.x / 2,
		get_viewport().size.y / 2
	)
	current_ball = ball_instance
	ball_spawn_timer.stop()

func remove_ball() -> void:
	current_ball.queue_free()
	current_ball = null

func start_ball_time() -> void:
	ball_spawn_timer.start()
	
func update_score(score_value: int, score_label: Label, prefix: String):
	score_label.text = prefix + str(score_value)

func check_score() -> void:
	if left_score >= SCORE_LIMIT:
		game_over("Left")
	elif right_score >= SCORE_LIMIT:
		game_over("Right")
	else:
		start_ball_time()
		
func game_over(who: String) -> void:
	game_over_label.visible = true
	game_over_label.text = who.to_upper() + " WIN"
	await get_tree().create_timer(3.0).timeout
	reset_scores()
	game_over_label.visible = false
	start_game()
	
func start_game() -> void:
	game_over_label.visible = true
	await get_tree().create_timer(1.0).timeout
	game_over_label.text = "3"
	await get_tree().create_timer(1.0).timeout
	game_over_label.text = "2"
	await get_tree().create_timer(1.0).timeout
	game_over_label.text = "1"
	await get_tree().create_timer(0.5).timeout
	ball_spawn_timer.start()
	await get_tree().create_timer(0.5).timeout
	game_over_label.visible = false
	
func reset_scores() -> void:
	right_score = 0
	left_score = 0
	update_score(0, left_score_label, LEFT_SCORE_PREFIX)
	update_score(0, right_score_label, RIGHT_SCORE_PREFIX)
