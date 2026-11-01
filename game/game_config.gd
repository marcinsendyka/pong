class_name GameConfig extends Resource

@export var players_count: int = 1

func _init(p_players_count: int = 1) -> void:
	players_count = p_players_count
