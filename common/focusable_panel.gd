class_name FocusablePanel extends Control

const NO_BORDER = preload("uid://wq1ssofujigm")
const BORDER = preload("uid://dtrogub4jelyx")


func _ready() -> void:
	add_theme_stylebox_override("panel", NO_BORDER)


func _focus_entered() -> void:
	add_theme_stylebox_override("panel", BORDER)


func _focus_exited() -> void:
	add_theme_stylebox_override("panel", NO_BORDER)


func _on_mouse_entered() -> void:
	grab_focus()
