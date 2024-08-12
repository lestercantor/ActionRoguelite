class_name MultiplicativeDamage
extends BaseUpgrade

@export var increase_percentage: float

var increase: float:
	get:
		return float(increase_percentage / 100)

func apply_upgrade(stats: StatsComponent):
	stats.new_stat("damage_multiplier", increase, stats.damage_multiplier) 
