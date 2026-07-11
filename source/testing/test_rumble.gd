extends Control


@onready var strength: HSlider = $CenterContainer/PanelContainer/VBoxContainer/HBoxContainer/Strength


func _physics_process(delta: float) -> void:
	Input.start_joy_vibration(0, strength.value, strength.value, delta)
