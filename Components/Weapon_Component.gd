class_name WeaponComponent
extends Node

@export var hitbox_component: HitboxComponent

# Get the information weapon from a resource 
@export var current_weapon: Weapon:
	set(new_weapon):
		if current_weapon == new_weapon: return
		
		current_weapon = new_weapon
		if is_node_ready():
			_update()
	
func set_damage(multipliers: float, additions: float) -> void:
	# Set the damage of the hitbox with the current weapon damage 
	# And multiply the damage with any multipliers (for future upgrades - this will probably be changed)
	hitbox_component.attack.damage = (current_weapon.damage + additions) * multipliers
	
func _update() -> void:
	if current_weapon != null:
		hitbox_component.attack.damage = current_weapon.damage
		print(current_weapon.name)
