class_name Ability
extends Resource

signal no_mana

# Store details about the ability
@export var damage: float
@export var name: String
@export var speed: float
@export var decay_timer: float
@export var mana_cost: float

# Make and store the specific projectile scene
# Mainly for different sprites and collisions
var projectile_scene: PackedScene

func use_ability(entity: Node2D, direction: Vector2) -> void:
	if can_cast_ability(entity.stats): return
	
	if projectile_scene == null:
		projectile_scene = load("res://Weapons/Projectiles/" + name +".tscn")
	
	var projectile: Projectile = projectile_scene.instantiate()
	projectile.new_attack = projectile_damage(entity.stats)
	projectile.speed = speed
	projectile.decay_timer = decay_timer
	
	entity.get_tree().root.add_child(projectile)
	projectile.direction = direction
	projectile.global_position = entity.global_position
	projectile.rotation = direction.angle()
	
	print("entity cast " + name)

# Boolean check to see if the entity has less mana than the cost of the ability
# So the ability won't be instantiated in memory 
func can_cast_ability(entity_stats: StatsComponent) -> bool:
	if entity_stats.mana < mana_cost:
		# Emit signal (for UI purposes - words no mana could flash above players head)
		no_mana.emit()
		return true
	else:
		# Subtract the mana cost from the entity's mana
		entity_stats.mana -= mana_cost
		print(entity_stats.mana)
		return false

# Calculate damage to passed 
func projectile_damage(entity_stats: StatsComponent) -> Attack:
	var calculated_damage: float = (damage + entity_stats.spell_addition) * entity_stats.spell_multiplier * check_can_crit(entity_stats)
	
	# Pass in the calculated damage through to the Attack class damage "constructor"
	var new_projectile: Attack = Attack._damage(calculated_damage)
	return new_projectile
	
func check_can_crit(entity_stats: StatsComponent) -> float:
	if entity_stats.spell_crit_chance == 0: return 1
	
	return entity_stats.calc_crit(entity_stats.spell_crit_chance)
