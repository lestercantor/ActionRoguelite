class_name ProjectileSpawnerComponent
extends WeaponComponent

@export var projectile: PackedScene

func projectile_damage(damage: float) -> Attack:
	var new_projectile = Attack.new()
	new_projectile.damage = (damage + stats.damage_addition) * stats.damage_multiplier * check_can_crit()
	return new_projectile

func shoot_projectile(direction: Vector2) -> void:
	var spawned_projectile = projectile.instantiate()
	spawned_projectile.new_attack = projectile_damage(spawned_projectile.projectile.damage)
	get_tree().current_scene.add_child(spawned_projectile)
	
	spawned_projectile.direction = direction
	spawned_projectile.global_position = global_position
	spawned_projectile.rotation = direction.angle()

func check_can_crit() -> float:
	if stats.spell_crit_chance == 0: return 1
	
	return stats.calc_crit(stats.spell_crit_chance)
