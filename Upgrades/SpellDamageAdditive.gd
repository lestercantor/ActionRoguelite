class_name AdditiveSpellUpgrade
extends BaseUpgrade

@export var increase: float = 10.0

func apply_upgrade(stats: StatsComponent) -> void:
	stats.new_stat("spell_addition", increase, stats.spell_addition)
