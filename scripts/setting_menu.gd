extends Control

@onready var music_toggle = $VBoxContainer/HBoxContainer/MusicToggle
@onready var volume_slider = $VBoxContainer/HBoxContainer2/VolumeSlider

# This function is called when the scene is loaded.
# It ensures the AudioServer matches the current state of the toggle and slider.
func _ready():
	var bus_index = AudioServer.get_bus_index("Music")
	
	# Sync toggle button to current mute state
	music_toggle.button_pressed = not AudioServer.is_bus_mute(bus_index)

	# Sync volume slider to current volume level
	var current_db = AudioServer.get_bus_volume_db(bus_index)
	var current_volume = db_to_linear(current_db) * 100.0
	volume_slider.value = current_volume

# Called when the MusicToggle is toggled (on/off).
# Updates the mute state of the "Music" audio bus.
func _on_music_toggle_toggled(toggled_on: bool) -> void:
	_update_music_toggle()

# Called when the VolumeSlider value is changed.
# Updates the volume (in dB) of the "Music" audio bus.
func _on_volume_slider_value_changed(value: float) -> void:
	_update_music_volume()

# Called when the Back button is pressed.
# Returns to the main menu scene.
func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

# Applies the current volume slider value to the Music bus in AudioServer.
func _update_music_volume():
	var db = linear_to_db(volume_slider.value / 100.0)
	var bus_index = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(bus_index, db)

# Applies the current toggle state to mute or unmute the Music bus.
func _update_music_toggle():
	var bus_index = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_mute(bus_index, not music_toggle.button_pressed)
