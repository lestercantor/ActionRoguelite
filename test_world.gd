extends Node2D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("debug_key"):
		print("enemy damage additions: ", $Enemy.stats_component.damage_addition)
		print("enemy2 damage additions: ", $Enemy2.stats_component.damage_addition)
