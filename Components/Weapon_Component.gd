class_name WeaponComponent
extends Node2D

@onready var stats: StatsComponent = get_owner().stats

# Get the hitbox component of this scene
@export var hitbox_component: HitboxComponent

# Get the information weapon from a resource 
@export var current_weapon: Weapon

# Calculate damage to deal by getting the stats resource from the owner
func calc_damage() -> Attack:
	# Make a new instance of the attack class to pass through to the hitbox
	# So it can pass the signal to the hurtbox
	var new_attack = Attack.new()
	new_attack.damage = (current_weapon.damage + stats.damage_addition) * stats.damage_multiplier * stats.calc_crit()
	return new_attack
