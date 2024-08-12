class_name Player
extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var entity_movement_input: EntityMovementVelocityInput = $EntityMovementVelocityInput
@onready var entity_movement: EntityMovement = $EntityMovement
@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var weapon_component: WeaponComponent = $WeaponComponent

@export var stats: StatsComponent

func _ready() -> void:
	new_modifiers()
	stats.stat_changed.connect(new_modifiers)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	# animation_tree.set("animation blend", entity_movement_input.input)
	# add animations here based on player input 
	
# Simple enable and disable hitbox collisions 
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("primary"):
		var direction: Vector2 = (get_global_mouse_position() - position).normalized()
		hitbox_component.rotation = direction.angle()
		$HitboxComponent/CollisionShape2D.disabled = false
		$Timer.start()
		entity_movement.attack_lunge(1.2, direction, stats.movement_stats.max_speed)
		
	if event.is_action_pressed("debug_key"):
		print("hitbox damage: ",hitbox_component.attack.damage)
		print("damage addition: ", stats.damage_addition)
		print("damage multiplier: ", stats.damage_multiplier)

func _on_timer_timeout() -> void:
	$HitboxComponent/CollisionShape2D.disabled = true

func new_modifiers() -> void:
	weapon_component.set_damage(stats.damage_multiplier, stats.damage_addition)
