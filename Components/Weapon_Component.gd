class_name WeaponComponent
extends Node

# Get the information weapon from a resource 
@export var current_weapon: Weapon
@export var hitbox_component: HitboxComponent

func set_damage(multipliers: float) -> void:
	# Set the damage of the hitbox with the current weapon damage 
	# And multiply the damage with any multipliers (for future upgrades - this will probably be changed)
	hitbox_component.attack.damage = current_weapon.damage * multipliers
	
