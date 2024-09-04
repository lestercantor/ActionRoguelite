extends Ability
class_name Fireball

func _init() -> void:
	damage = 100.0
	name = "Fireball"
	speed = 150.0
	decay_timer = 1
	mana_cost = 1
	cooldown = 10
	
	super._init()
