class_name Projectile
extends CharacterBody2D

@onready var hitbox_component: HitboxComponent = $HitboxComponent

# Setting the attack value inside the spawn projectile component
# Something that needs work... I want it inside calc_damage as local variable

# Variables passed through from the ability script when instantiating the projectile
var direction: Vector2
var decay_timer: float
var speed: float
var caster
var damage: float

func _ready() -> void:
	# Create simple one shot scene tree timer that connects to queue free when the timer ends
	get_tree().create_timer(decay_timer).timeout.connect(queue_free)
	
	# Connect to the hit hurtbox signal so it can free itself after it has hit a hurtbox
	hitbox_component.hit_hurtbox.connect(on_hit)
	
	# Set the collision layer when the node is ready
	# ... not sure if there's a way to do it through _init() since the
	# hitbox is part of the scene and the scene is being instantiated
	set_caster()

# Move the projectile in the given direction using its speed
func _physics_process(delta: float) -> void:
	velocity = direction * speed
	move_and_collide(velocity * delta)

func on_hit(hurtbox: HurtboxComponent) -> void:
	queue_free()

# new_attack is getting assigned and is then passing it to the hitbox component
func calc_damage() -> Attack:
	var new_attack = Attack.new()._damage(damage)
	return new_attack

# Set the variables of the projectile when instantiating through the ability class 
func with_data(entity: Node2D, _dir: Vector2, _decay: float, _speed: float, _damage: float) -> Projectile:
	# Entity passes itself as a parameter
	caster = entity
	
	# Set the variables by passing it through parameters so it's easier to read
	direction = _dir
	decay_timer = _decay
	speed = _speed
	damage = _damage
	# Set position and rotation relative to the entity that cast it
	global_position = entity.global_position
	rotation = _dir.angle()
	
	return self

########################################################################
# The projectile needs to know who the caster is to set the 
# collision mask properly so that the caster isn't hurting themselves
# with their own spell. If the caster is the player, then set the 
# collision mask to 3 (which is enemy hurtbox). Otherwise 
# set the collision mask to 5 (which is the player hurtbox)
########################################################################
func set_caster() -> void: 
	if caster is Player:
		hitbox_component.set_collision_mask_value(5, true)
	else:
		hitbox_component.set_collision_mask_value(3, true)
