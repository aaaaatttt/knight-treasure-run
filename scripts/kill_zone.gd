extends Area2D

@onready var timer: Timer = $Timer
@onready var game_over_scene = preload("res://scenes/game_over_menu.tscn")

func _on_body_entered(body: Node2D) -> void:
	print("You died!")

	# Slow motion effect
	Engine.time_scale = 0.5

	# Remove the collision shape to prevent further movement
	if body.has_node("CollisionShape2D"):
		body.get_node("CollisionShape2D").queue_free()

	# Start the timer to delay showing the game over menu
	timer.start()


func _on_timer_timeout() -> void:
	# Restore normal time scale
	Engine.time_scale = 1.0

	# Load the game over menu (do not reload the scene)
	var game_over = game_over_scene.instantiate()
	get_tree().current_scene.add_child(game_over)
