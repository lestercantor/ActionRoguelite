class_name CritChanceUpgrade
extends BaseUpgrade

@export var increase_percentage: float

var increase: float:
	get:
		return float(increase_percentage / 100)

func apply_upgrade(stats: StatsComponent) -> void:
	stats.new_stat("crit_chance", increase, stats.crit_chance) 
