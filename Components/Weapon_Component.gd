class_name WeaponComponent
extends Node2D

@onready var stats: StatsComponent = get_owner().stats

# Calculate damage to deal by getting the stats resource from the owner
func calc_damage() -> Attack:
	return null

func check_can_crit() -> float:
	return 1
