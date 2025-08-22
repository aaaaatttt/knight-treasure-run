extends Node

var score = 0

@onready var score_label = get_parent().get_node("CanvasLayer/ScoreLabel")
var total_coins = 0
@onready var goal_scene = preload("res://scenes/goal.tscn")

func _ready():
	await get_tree().process_frame
	total_coins = get_tree().get_nodes_in_group("coins").size()
	print("🎯 Total coins in level: ", total_coins)

func add_point():
	score += 1
	print("📈 Score increased to: ", score)
	score_label.text = "You collected " + str(score) + " coins."

	if score == total_coins:
		print("🎉 All coins collected. Spawning goal!")  
		spawn_goal()

func spawn_goal():
	print("⚠️ spawn_goal called")
	var goal = goal_scene.instantiate()
	print("✅ goal instantiated")

	var player = get_node("/root/game/player")
	print("✅ player node:", player)

	goal.position = player.position + Vector2(50, -40)
	goal.scale = Vector2(0.1, 0.1)  
	get_parent().add_child(goal)
	print("✅ goal added to scene at:", goal.position)
