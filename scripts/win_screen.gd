extends CanvasLayer


# Called when the Restart button is pressed
func _on_restart_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

# Called when the Main Menu button is pressed
func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

# Called when the Quit button is pressed
func _on_quit_button_pressed() -> void:
	get_tree().quit()
