class_name PlayerPaddleController extends PaddleController

var default = PlayerControls.new()

@export
var _pc: PlayerControls

func _init(p_pc: PlayerControls = default) -> void:
	_pc = p_pc

func get_axis() -> float:
	return Input.get_axis(_pc.action_up, _pc.action_down)
