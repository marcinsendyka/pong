class_name Menu extends Node

const MAIN_MENU = preload("uid://bq5s1ahholprd")
const CONTROLS = preload("uid://dlgw1jw5l2h21")
var _main_menu: Node
var _controls: Node


func _ready() -> void:
	_show_main_menu()


func _show_main_menu() -> void:
	var main_menu: MainMenu = MAIN_MENU.instantiate()
	main_menu.controls_pressed.connect(_show_controls)
	main_menu.name = "Main menu"
	_drop(_controls)
	add_child(main_menu)
	_main_menu = main_menu


func _show_controls() -> void:
	var controls: Controls = CONTROLS.instantiate()
	controls.exit.connect(_show_main_menu)
	controls.name = "Controls"
	_drop(_main_menu)
	add_child(controls)
	_controls = controls


func _drop(node: Node) -> void:
	if is_instance_valid(node):
		remove_child(node)
		node.queue_free()
