extends Control

@export var game_scene: PackedScene

@onready var _1p: Button = %"1p"

func _ready() -> void:
	_1p.grab_focus.call_deferred()

func _on_p_pressed() -> void:
	run_game_scene(GameConfig.new(1))

func _on_p2_pressed() -> void:
	run_game_scene(GameConfig.new(2))

func run_game_scene(gc: GameConfig) -> void:
	create_tween()
	var game: Game = game_scene.instantiate()
	game.initalize(gc)
	get_tree().change_scene_to_node(game)
	
