class_name Game extends Node2D

const PAUSE = preload("uid://no8ufapewv7c")
@export
var _default_game_config: GameConfig
var MENU: PackedScene = load("uid://ng3r4lwkfdp8")

var _game_config: GameConfig
@onready var level: Level = $Level
@onready var hud: CanvasLayer = $Hud


func _ready() -> void:
	var cfg: GameConfig = _get_config()
	level.config = cfg
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = true
		var pause = PAUSE.instantiate()
		hud.add_child(pause)
		var to_main_menu = await pause.exit
		get_tree().paused = false
		if to_main_menu:
			var menu = MENU.instantiate()
			get_tree().change_scene_to_node(menu)


func initalize(p_game_config: GameConfig) -> void:
	_game_config = p_game_config


func _get_config() -> GameConfig:
	if not _game_config:
		push_warning("Game config not initalized, fallback to default.")
		return _default_game_config
	return _game_config
