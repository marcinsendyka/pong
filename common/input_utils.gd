class_name InputUtils
extends Node


static func any_key_pressed(input: InputEvent) -> bool:
	return input is InputEventKey and input.is_pressed() and !input.is_echo()


static func mouse_click(input: InputEvent) -> bool:
	return input is InputEventMouse and input.is_pressed() and !input.is_echo()


static func trigger_action(action: String, pressed: bool = true) -> void:
	var ev = InputEventAction.new()
	ev.action = action
	ev.pressed = pressed
	Input.parse_input_event(ev)
