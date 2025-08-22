extends CanvasLayer


@onready var retry_button = $RetryButton
@onready var menu_button = $MenuButton

func _ready():
	retry_button.pressed.connect(on_retry_pressed)
	menu_button.pressed.connect(on_menu_pressed)

func on_retry_pressed():
	get_tree().reload_current_scene()

func on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
