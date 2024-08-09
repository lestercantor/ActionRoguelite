extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var entity_movement_input: EntityMovementVelocityInput = $EntityMovementVelocityInput
@onready var entity_movement: EntityMovement = $EntityMovement
@onready var hitbox_component: HitboxComponent = $HitboxComponent

@export var current_weapon: Weapon:
	set(new_weapon):
		if current_weapon == new_weapon: return
		
		current_weapon = new_weapon
		if is_node_ready():
			_update()
		
	
func _ready() -> void:
	_update()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	# animation_tree.set("animation blend", entity_movement_input.input)
	# add animations here based on player input 

func set_damage(amount: float) -> void:
	hitbox_component.damage = amount

func _update() -> void:
	if current_weapon != null:
		set_damage(current_weapon.damage)
		print(current_weapon.name)
