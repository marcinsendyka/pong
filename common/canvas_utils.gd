class_name CanvasUtils extends Node

static func center_of_viewport(viewport: Viewport) -> Vector2:
	return viewport.get_visible_rect().get_center()
