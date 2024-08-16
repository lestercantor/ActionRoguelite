class_name StatsComponent
extends Resource

# Signals to connect to owner of component 
signal no_health
signal health_changed

signal mana_changed

signal stat_changed

# Movement related variables
@export var movement_stats: EntityMovementStats

# Damage related variables
@export var damage_multiplier: float = 1.0
@export var damage_addition: float = 0.0

@export var crit_chance: float = 0.0
@export var spell_crit_chance: float = 0.0

# Health related variables
@export var max_health: float = 1000.0
@export var health: float = 100.0:
	set(value):
		# Clamp health so if there is any healing it won't go over max
		# And won't deal negative damage
		# snappedf function rounds the number to the nearest step 
		# 0.01 means it will be rounded to 2 decimal places
		health = snappedf(clampf(value, 0, max_health), 0.01)
		
		# Signal that the health has changed so we can perform other functions
		# Such as UI changes
		health_changed.emit()
		
		# Signal that there is no health so we can queue_free()
		if health <= 0: no_health.emit()

@export var max_mana: float = 1000.0
@export var mana: float = 100.0:
	set(value):
		mana = snappedf(clampf(value, 0, max_mana), 0.01)
		mana_changed.emit()
# Return value is the critical hit modifier and a random number is generated
# To find out if the the players crit chance is less than the random number
# Then apply the appropriate crit
func calc_crit(chance) -> float:
	var rand_num = randf_range(0, 1) 
	print("random number generator: ", rand_num)
	if rand_num < chance:
		return 1.75
	else:
		return 1

# Get the variable name of the stat and increase its value by an amount to increase
# (Currently have the upgrades as a collision in world but this function should be the same)
func new_stat(stat_name: StringName, increase: float, stat: float):
	stat += increase
	set(stat_name, stat)
	stat_changed.emit()
