extends Area2D

# When the player touches the goal, go to the win screen
func _on_body_entered(body):
	if body.name == "player":
		get_tree().change_scene_to_file("res://scenes/win_screen.tscn")
