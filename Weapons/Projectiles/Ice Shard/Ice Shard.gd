extends Ability
class_name Ice_Shard

func _init() -> void:
	damage = 85
	name = "Ice Shard"
	speed = 150
	decay_timer = 5
	mana_cost = 1
	cooldown = 5
	
	super()
