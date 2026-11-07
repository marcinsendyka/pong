class_name KeyPanel extends FocusablePanel

signal selected(_self: KeyPanel)

@export var control = "UP":
	set(val):
		control = val
		if control_label:
			control_label.text = val
@export var key = "ARROW UP":
	set(val):
		key = val
		if key_label:
			key_label.text = val

@export var action: StringName
@onready var key_label: Label = %Key
@onready var control_label: Label = %Control


func _ready() -> void:
	super()
	key_label.text = key
	control_label.text = control


func _on_gui_input(event: InputEvent) -> void:
	if InputUtils.primary_mouse_click(event):
		selected.emit(self)
	if event.is_action_pressed(&"ui_accept"):
		selected.emit(self)
