class_name AdditiveDamageUpgrade
extends BaseUpgrade

@export var increase: float = 10.0

func apply_upgrade(stats: StatsComponent) -> void:
	stats.new_stat("damage_addition", increase, stats.damage_addition)
