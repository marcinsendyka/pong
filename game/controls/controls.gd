class_name Controls extends Control

signal _input_provided(input: InputEvent)
signal exit
var _is_waiting_for_input: bool = false
@onready var p_1_key_panel_up: KeyPanel = %P1KeyPanelUp
@onready var p_1_key_panel_down: KeyPanel = %P1KeyPanelDown
@onready var p_2_key_panel_up: KeyPanel = %P2KeyPanelUp
@onready var p_2_key_panel_down: KeyPanel = %P2KeyPanelDown
@onready var press_key_container: VBoxContainer = %PressKeyContainer
@onready var key_taken_container: VBoxContainer = %KeyTakenContainer


func _ready() -> void:
	if InputMap.get_actions().is_empty():
		InputMap.load_from_project_settings()
	p_1_key_panel_up.key = get_key_string(InputMap.action_get_events(p_1_key_panel_up.action))
	p_1_key_panel_down.key = get_key_string(InputMap.action_get_events(p_1_key_panel_down.action))
	p_2_key_panel_up.key = get_key_string(InputMap.action_get_events(p_2_key_panel_up.action))
	p_2_key_panel_down.key = get_key_string(InputMap.action_get_events(p_2_key_panel_down.action))

	p_1_key_panel_up.selected.connect(change_key)
	p_1_key_panel_down.selected.connect(change_key)
	p_2_key_panel_up.selected.connect(change_key)
	p_2_key_panel_down.selected.connect(change_key)
	press_key_container.visible = false
	key_taken_container.visible = false
	
	p_1_key_panel_up.grab_focus()


func _input(event: InputEvent) -> void:
	if not _is_waiting_for_input:
		return

	if event is InputEventKey:
		get_viewport().set_input_as_handled()
		if event.pressed and not event.echo:
			_input_provided.emit(event)


func _unhandled_input(event: InputEvent) -> void:
	if not _is_waiting_for_input and event.is_action_pressed(&"ui_cancel"):
		_back_to_main_menu()


func get_key_string(inputs: Array[InputEvent]) -> String:
	for input: InputEvent in inputs:
		if input is InputEventKey:
			return input.as_text()

	return "unmapped"


func get_key(inputs: Array[InputEvent]) -> InputEventKey:
	for input: InputEvent in inputs:
		if input is InputEventKey:
			return input
	return null


func change_key(panel: KeyPanel) -> void:
	if _is_waiting_for_input:
		return

	_is_waiting_for_input = true
	press_key_container.visible = true
	panel.key = "WAITING"
	get_viewport().set_input_as_handled()
	var input: InputEvent = await _input_provided
	if not input.is_action_pressed(&"ui_cancel") and input is InputEventKey:
		var key = input as InputEventKey
		var key_codes = _get_other_key_codes(panel)
		if not key_codes.any(func(s: Key) -> bool: return s == key.physical_keycode):
			InputMap.action_erase_event(
				panel.action,
				get_key(InputMap.action_get_events(panel.action))
			)
			var new_mapping = InputEventKey.new()
			new_mapping.physical_keycode = key.physical_keycode
			new_mapping.device = -1
			InputMap.action_add_event(panel.action, new_mapping)
		else:
			press_key_container.visible = false
			key_taken_container.visible = true
			await get_tree().create_timer(2.0).timeout
			key_taken_container.visible = false
			get_viewport().set_input_as_handled()
			change_key(panel)

	_is_waiting_for_input = false
	press_key_container.visible = false
	panel.key = get_key_string(InputMap.action_get_events(panel.action))
	print_debug(InputMap.action_get_events(panel.action))


func _get_other_key_codes(panel: KeyPanel) -> Array[Key]:
	var keys: Array[Key] = []
	var panels = [p_1_key_panel_up, p_1_key_panel_down, p_2_key_panel_up, p_2_key_panel_down]
	panels.erase(panel)
	for p: KeyPanel in panels:
		var events = InputMap.action_get_events(p.action)
		var event: InputEventKey = get_key(events)
		keys.append(event.physical_keycode)
	return keys


func _back_to_main_menu() -> void:
	exit.emit()


func _on_button_pressed() -> void:
	_back_to_main_menu()
