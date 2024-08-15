class_name Projectile
extends CharacterBody2D

@onready var hitbox_component: HitboxComponent = $HitboxComponent

@export var projectile: BaseProjectile:
		set(value):
			projectile = value

var new_attack = Attack.new()

var direction: Vector2

func _ready() -> void:
	hitbox_component.hit_hurtbox.connect(on_hit)

func _physics_process(delta: float) -> void:
	
	velocity = direction * projectile.speed
	
	move_and_collide(velocity * delta)

func on_hit(hurtbox: HurtboxComponent) -> void:
	queue_free()


func calc_damage() -> Attack:
	return new_attack
