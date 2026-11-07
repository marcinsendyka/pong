class_name Pause extends PanelContainer

signal exit(to_main_menu: bool)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_viewport().set_input_as_handled()
		exit.emit(false)
		queue_free()
	
func _on_resume_pressed() -> void:
	exit.emit(false)
	queue_free()


func _on_main_menu_pressed() -> void:
	exit.emit(true)
	queue_free()
