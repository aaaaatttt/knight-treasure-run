extends Area2D

@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer


func _ready():
	print("coin ready: ", name)
	if not is_in_group("coins"):
		add_to_group("coins")


func _on_body_entered(body):
	if body.name == "player":
		print("✅ Player touched coin")
		game_manager.add_point()
		animation_player.play("pickup")
