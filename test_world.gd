extends Node2D

#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("debug_key"):
		#print("enemy damage additions: ", $Enemy.stats_component.damage_multiplier)
		#print("enemy2 damage additions: ", $Enemy2.stats_component.damage_multiplier)

#func _ready() -> void:
	#for i in ProjectSettings.get_global_class_list():
		#if i["base"] == "Ability":
			#print(i["class"])
