class_name MeleeWeaponComponent
extends WeaponComponent

@export var melee_weapon: Weapon

func calc_damage() -> Attack:
	# Make a new instance of the attack class to pass through to the hitbox
	# So it can pass the signal to the hurtbox
	var calculated_damage: float = (melee_weapon.damage + stats.damage_addition) * stats.damage_multiplier * check_can_crit()
	var new_attack = Attack._damage(calculated_damage)
	return new_attack

func check_can_crit() -> float:
	if (melee_weapon.can_crit == false) or (stats.crit_chance == 0): return 1
	
	return stats.calc_crit(stats.crit_chance)
