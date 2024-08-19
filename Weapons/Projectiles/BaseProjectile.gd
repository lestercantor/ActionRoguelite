class_name Projectile
extends CharacterBody2D

@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var timer: Timer = $Timer

# Setting the attack value inside the spawn projectile component
# Something that needs work... I want it inside calc_damage as local variable
var new_attack = Attack.new()

# General vector direction passed in through from the spawner component
var direction: Vector2
var decay_timer: float
var speed: float

func _ready() -> void:
	timer.timeout.connect(queue_free)
	hitbox_component.hit_hurtbox.connect(on_hit)
	timer.start(decay_timer)

# Move the projectile in the given direction using its speed
func _physics_process(delta: float) -> void:
	velocity = direction * speed
	move_and_collide(velocity * delta)

func on_hit(hurtbox: HurtboxComponent) -> void:
	queue_free()

# new_attack is getting assigned and is then passing it to the hitbox component
func calc_damage() -> Attack:
	return new_attack
