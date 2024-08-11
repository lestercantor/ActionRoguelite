extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var entity_movement_input: EntityMovementVelocityInput = $EntityMovementVelocityInput
@onready var entity_movement: EntityMovement = $EntityMovement
@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var weapon_component: WeaponComponent = $WeaponComponent

@export var stats: StatsComponent
@export var upgrades: BaseUpgrade:
	set(value):
		upgrades = value

func _ready() -> void:
	weapon_component.set_damage(stats.damage_multiplier, stats.damage_addition)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	# animation_tree.set("animation blend", entity_movement_input.input)
	# add animations here based on player input 
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("debug_key"):
		print("damage multiplier: ", stats.damage_multiplier)
		print("current damage: ", hitbox_component.attack.damage)
		
	if event.is_action_pressed("add_damage"):
		upgrades.apply_upgrade(stats)
		weapon_component.set_damage(stats.damage_multiplier, stats.damage_addition)
		print(stats.damage_addition)
