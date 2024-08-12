class_name AdditiveDamageUpgrade
extends BaseUpgrade

@export var increase: float = 0.0

func apply_upgrade(stats: StatsComponent):
	stats.new_stat("damage_addition", increase, stats.damage_addition)
