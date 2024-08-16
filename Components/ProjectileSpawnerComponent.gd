class_name ProjectileSpawnerComponent
extends WeaponComponent

@export var projectile_scene: PackedScene

# Calculate the damage of the projectile 
func projectile_damage(damage: float) -> Attack:
	var new_projectile = Attack.new()
	new_projectile.damage = (damage + stats.damage_addition) * stats.damage_multiplier * check_can_crit()
	return new_projectile

func shoot_projectile(direction: Vector2) -> void:
	# Instantiate the object of the projectile scene
	var projectile = projectile_scene.instantiate()
	if projectile.projectile.mana_cost > stats.mana: 
		projectile.queue_free()
		return
		
	# Set the attack variable in the projectile script using the damage function
	projectile.new_attack = projectile_damage(projectile.projectile.damage)
	stats.mana -= projectile.projectile.mana_cost

	# Add it to the scene
	get_tree().current_scene.add_child(projectile)
	
	# Set direction, position and angle so it knows where to be fired from
	# And which direction to dravel in
	projectile.direction = direction
	projectile.global_position = global_position
	projectile.rotation = direction.angle()

func check_can_crit() -> float:
	if stats.spell_crit_chance == 0: return 1
	
	return stats.calc_crit(stats.spell_crit_chance)
