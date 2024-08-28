class_name Ability
extends Resource

signal no_mana

# Store details about the ability
@export var damage: float
@export var name: String
@export var speed: float
@export var decay_timer: float
@export var mana_cost: float
@export var cooldown: float

# Make and store the specific projectile scene
# Mainly for different sprites and collisions
var projectile_scene: PackedScene

func _init() -> void:
	projectile_scene = load("res://Weapons/Projectiles/" + name +".tscn")
	
func button_data(button: AbilityButton) -> Ability:
	button.timer.wait_time = cooldown
	return self


func use_ability(entity: Node2D, direction: Vector2) -> void:
	if can_cast_ability(entity.stats): return
	
	# Set variables inside the projectile script before adding to scene tree...
	# Using function inside the projectile to decouple and to enforce readability
	var projectile: Projectile = projectile_scene.instantiate().with_data(entity, direction, decay_timer, speed, projectile_damage(entity.stats).damage)
	
	# Get the entity that cast it and add to scene tree from the root 
	# Making it a child of the entity that cast it means it will follow its position and rotation
	# Which is unwanted behaviour
	entity.get_tree().root.add_child(projectile)
	
	#print("entity cast " + name)

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
		return false

# Calculate damage to passed 
func projectile_damage(entity_stats: StatsComponent) -> Attack:
	var calculated_damage: float = (damage + entity_stats.spell_addition) * entity_stats.spell_multiplier * check_can_crit(entity_stats)
	
	# Pass in the calculated damage through to the Attack class damage "constructor"
	var new_projectile: Attack = Attack._damage(calculated_damage)
	print("projectile damage: ", new_projectile.damage)
	return new_projectile
	
func check_can_crit(entity_stats: StatsComponent) -> float:
	if entity_stats.spell_crit_chance == 0: return 1
	
	return entity_stats.calc_crit(entity_stats.spell_crit_chance)
