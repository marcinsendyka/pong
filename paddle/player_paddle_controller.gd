class_name PlayerPaddleController extends PaddleController

var default = PlayerControls.new()

@export
var _pc: PlayerControls

func _init(p_pc: PlayerControls = default) -> void:
	_pc = p_pc

func is_up() -> bool:
	return Input.is_action_pressed(_pc.action_up)

func is_down() -> bool:
	return Input.is_action_pressed(_pc.action_down)
