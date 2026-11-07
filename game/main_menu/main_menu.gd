class_name MainMenu extends Control

@export var game_scene: PackedScene

@onready var _1p: Button = %"1p"

signal controls_pressed

func _ready() -> void:
	_1p.grab_focus.call_deferred()


func run_game_scene(gc: GameConfig) -> void:
	create_tween()
	var game: Game = game_scene.instantiate()
	game.initalize(gc)
	get_tree().change_scene_to_node(game)


func _on_p_pressed() -> void:
	run_game_scene(GameConfig.new(1))


func _on_p2_pressed() -> void:
	run_game_scene(GameConfig.new(2))


func _on_controls_pressed() -> void:
	controls_pressed.emit()
