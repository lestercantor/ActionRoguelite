extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var entity_movement_input: EntityMovementVelocityInput = $EntityMovementVelocityInput
@onready var entity_movement: EntityMovement = $EntityMovement
@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var weapon_component: WeaponComponent = $WeaponComponent

@export var stats_component: StatsComponent
#@export var current_weapon: Weapon:
	#set(new_weapon):
		#if current_weapon == new_weapon: return
		#
		#current_weapon = new_weapon
		##if is_node_ready():
			##_update()
		#
	
func _ready() -> void:
	#_update()
	weapon_component.set_damage(stats_component.damage_multiplier)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	# animation_tree.set("animation blend", entity_movement_input.input)
	# add animations here based on player input 
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("debug_key"):
		print("damage multiplier: ", stats_component.damage_multiplier)
		print("current damage: ", hitbox_component.attack.damage)
	
	if Input.is_action_just_pressed("add_damage"):
		add_damage()
#func set_damage(amount: float) -> void:
	#hitbox_component.damage = amount
#
#func _update() -> void:
	#if current_weapon != null:
		#set_damage(current_weapon.damage)
		#print(current_weapon.name)
func add_damage() -> void: 
	stats_component.damage_multiplier += 0.10
	weapon_component.set_damage(stats_component.damage_multiplier)
	print("damage multiplier: ", stats_component.damage_multiplier)
