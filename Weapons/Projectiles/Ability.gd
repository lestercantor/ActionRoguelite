class_name Ability
extends Resource

@export var damage: float
@export var name: String
@export var speed: float
@export var decay_timer: float
@export var mana_cost: float

@export var projectile_scene: PackedScene

func use_ability(entity: Node2D, direction: Vector2) -> void:
	if can_cast_ability(entity.stats): return
	
	var projectile: Projectile = projectile_scene.instantiate()
	projectile.new_attack = projectile_damage(entity.stats)
	projectile.speed = speed
	projectile.decay_timer = decay_timer
	
	entity.get_tree().root.add_child(projectile)
	projectile.direction = direction
	projectile.global_position = entity.global_position
	projectile.rotation = direction.angle()
	
	print("entity cast " + name)

func can_cast_ability(entity_stats: StatsComponent) -> bool:
	if entity_stats.mana < mana_cost:
		print("out of mana")
		return true
	else:
		entity_stats.mana -= mana_cost
		print(entity_stats.mana)
		return false

func projectile_damage(entity_stats: StatsComponent) -> Attack:
	var new_projectile = Attack.new()
	new_projectile.damage = (damage + entity_stats.spell_addition) * entity_stats.spell_multiplier * check_can_crit(entity_stats)
	return new_projectile
	
func check_can_crit(entity_stats: StatsComponent) -> float:
	if entity_stats.spell_crit_chance == 0: return 1
	
	return entity_stats.calc_crit(entity_stats.spell_crit_chance)
