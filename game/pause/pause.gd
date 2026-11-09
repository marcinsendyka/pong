class_name Pause extends PanelContainer

signal exit(to_main_menu: bool)
@onready var resume: Button = %Resume


func _ready() -> void:
	resume.grab_focus()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_viewport().set_input_as_handled()
		_on_resume_pressed()


func _on_resume_pressed() -> void:
	exit.emit(false)
	queue_free()
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN


func _on_main_menu_pressed() -> void:
	exit.emit(true)
	queue_free()
