extends CanvasLayer

signal countdown_finished

@onready
var left_score_label: Label = %ScoreLeft
@onready
var right_score_label: Label = %ScoreRight
@onready 
var countdown: Label = %Countdown

func _ready() -> void:
	countdown.visible = false
	await display_countdown()
	countdown_finished.emit()
	
func display_countdown() -> void:
	countdown.visible = true
	countdown.text = "3"
	# creates SceneTimer and waits 1 second
	# until timeout signal is emitted
	await get_tree().create_timer(1.0).timeout 
	countdown.text = "2"
	await get_tree().create_timer(1.0).timeout
	countdown.text = "1"
	await get_tree().create_timer(1.0).timeout
	countdown.visible = false

func set_player1_score(score : int) -> void:
	left_score_label.text = "Left: " + str(score)

func set_player2_score(score : int) -> void:
	right_score_label.text = "Right: " + str(score)
