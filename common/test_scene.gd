extends Node2D

func _ready() -> void:
	var win := get_window()
	win.content_scale_mode = Window.CONTENT_SCALE_MODE_CANVAS_ITEMS
	win.content_scale_aspect = Window.CONTENT_SCALE_ASPECT_EXPAND
	win.content_scale_size = Vector2i(1152, 648)
	var min_size := win.content_scale_size
	if win.size.x < min_size.x or win.size.y < min_size.y:
		win.size = win.size.max(min_size)
