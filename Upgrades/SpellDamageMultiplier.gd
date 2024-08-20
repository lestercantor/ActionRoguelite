class_name MultiplicativeSpell
extends BaseUpgrade

@export var increase_percentage: float = 5

var increase: float:
	get:
		return float(increase_percentage / 100)

func apply_upgrade(stats: StatsComponent):
	stats.new_stat("spell_multiplier", increase, stats.spell_multiplier) 
