class_name Player
extends Entity

@onready var entity_movement_input: EntityMovementVelocityInput = $EntityMovementVelocityInput
@onready var hitbox_component: HitboxComponent = $MeleeWeaponComponent/HitboxComponent
@onready var weapon_component: WeaponComponent = $MeleeWeaponComponent

var ability1: Ability = Fireball.new()

var time: float = 0

func _ready() -> void:
	super()
	
func _process(_delta: float) -> void:
	pass
	# animation_tree.set("animation blend", entity_movement_input.input)
	# add animations here based on player input 

func _physics_process(delta: float) -> void:
	if time > 0:
		time -= delta

# Simple enable and disable hitbox collisions 
func _input(event: InputEvent) -> void:
	var direction: Vector2 = (get_global_mouse_position() - position).normalized()
	if event.is_action_pressed("primary"):
		hitbox_component.rotation = direction.angle()
		time = weapon_component.melee_weapon.attack_speed
		$MeleeWeaponComponent/HitboxComponent/WeaponCollisionShape.disabled = false
		entity_movement.dash(1.2, direction, stats.movement_stats.max_speed)
		
		
	if event.is_action_pressed("debug_key"):
		print("damage multiplier: ", stats.damage_multiplier)
		print("damage additions: ", stats.damage_addition)
		print("crit chance: ", stats.crit_chance)
		print("spell multiplier: ", stats.spell_multiplier)
		
	if event.is_action_pressed("dash"):
		entity_movement.dash(5, entity_movement_input.movement_input, stats.movement_stats.max_speed)
