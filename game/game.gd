class_name Game extends Node2D

var _game_config: GameConfig
@export
var _default_game_config: GameConfig

@onready var level: Level = $Level

func initalize(p_game_config: GameConfig) -> void:
	_game_config = p_game_config

func _get_config() -> GameConfig:
	if not _game_config:
		push_warning("Game config not initalized, fallback to default.")
		return _default_game_config
	return _game_config

func _ready() -> void:
	var cfg: GameConfig = _get_config()
	level.config = cfg
