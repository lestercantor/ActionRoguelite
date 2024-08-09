class_name HitboxComponent
extends Area2D

signal hit_hurtbox(hurtbox)

# Make global variable to hitbox component so it can be accessed
var attack: Attack = Attack.new()

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	
func _on_area_entered(hurtbox: HurtboxComponent) -> void:
	# Check if we are not colliding with a hurtbox and return out of function if true
	if not hurtbox is HurtboxComponent: return
	
	# Signal we have hit a hurtbox (useful for destroying projectiles when they hit something)
	hit_hurtbox.emit(hurtbox)
	
	# Signal out itself and the attack that was made
	hurtbox.hurt.emit(self, attack)
	
	# Debug purposes
	print("damage dealt: ", attack.damage)
