class_name Intro extends Control

@export var next_scene: PackedScene
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var fps: float = 10.0
var _acc = 0.0
var step := 1.0 / fps

func _ready() -> void:
	animation_player.callback_mode_process = AnimationMixer.ANIMATION_CALLBACK_MODE_PROCESS_MANUAL
	await animation_player.animation_finished
	switch_to_main_menu()

func _process(delta: float) -> void:
	_acc += delta
	while _acc >= step:
		_acc -= step
		animation_player.advance(step)
	
func _input(event: InputEvent) -> void:
	if InputUtils.any_key_pressed(event) or InputUtils.any_mouse_click(event):
		switch_to_main_menu()

func switch_to_main_menu() -> void:
	get_tree().change_scene_to_packed(next_scene)
