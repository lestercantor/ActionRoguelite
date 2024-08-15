class_name Player
extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var entity_movement_input: EntityMovementVelocityInput = $EntityMovementVelocityInput
@onready var entity_movement: EntityMovement = $EntityMovement
@onready var hitbox_component: HitboxComponent = $WeaponComponent/HitboxComponent
@onready var weapon_component: WeaponComponent = $WeaponComponent

@export var stats: StatsComponent
var time: float = 0

func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	# animation_tree.set("animation blend", entity_movement_input.input)
	# add animations here based on player input 

func _physics_process(delta: float) -> void:
	if time > 0:
		time -= delta
		#$WeaponComponent/HitboxComponent/CollisionShape2D.disabled = true

# Simple enable and disable hitbox collisions 
func _input(event: InputEvent) -> void:
	var direction: Vector2 = (get_global_mouse_position() - position).normalized()
	if event.is_action_pressed("primary"):
		hitbox_component.rotation = direction.angle()
		time = weapon_component.current_weapon.attack_speed
		$WeaponComponent/HitboxComponent/CollisionShape2D.disabled = false
		entity_movement.attack_lunge(1.2, direction, stats.movement_stats.max_speed)
	
	if event.is_action_pressed("skill 1"):
		weapon_component.shoot_projectile(direction)

	if event.is_action_pressed("debug_key"):
		print("damage multiplier: ", stats.damage_multiplier)
		print("damage additions: ", stats.damage_addition)
		print("crit chance: ", stats.crit_chance)
