class_name WeaponComponent
extends Node2D

@onready var stats: StatsComponent = get_owner().stats
@onready var hitbox_component: HitboxComponent = $HitboxComponent

# Get the information weapon from a resource 
@export var current_weapon: Weapon
@export var projectile: PackedScene

# Calculate damage to deal by getting the stats resource from the owner
func calc_damage() -> Attack:
	# Make a new instance of the attack class to pass through to the hitbox
	# So it can pass the signal to the hurtbox
	var new_attack = Attack.new()
	new_attack.damage = (current_weapon.damage + stats.damage_addition) * stats.damage_multiplier * check_can_crit()
	return new_attack

func check_can_crit() -> float:
	if (current_weapon.can_crit == false) or (stats.crit_chance == 0): return 1
	
	return stats.calc_crit()

func projectile_damage(damage: float) -> Attack:
	var new_projectile = Attack.new()
	new_projectile.damage = (damage + stats.damage_addition) * stats.damage_multiplier
	return new_projectile

func shoot_projectile(direction: Vector2) -> void:
	var spawned_projectile = projectile.instantiate()
	spawned_projectile.new_attack = projectile_damage(spawned_projectile.projectile.damage)
	get_tree().root.add_child(spawned_projectile)
	
	spawned_projectile.direction = direction
	spawned_projectile.global_position = global_position
	spawned_projectile.rotation = direction.angle()
