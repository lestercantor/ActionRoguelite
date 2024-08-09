class_name WeaponComponent
extends Node

@export var current_weapon: Weapon
@export var hitbox_component: HitboxComponent

func set_damage(multipliers: float) -> void:
	hitbox_component.attack.damage = current_weapon.damage * multipliers
	
