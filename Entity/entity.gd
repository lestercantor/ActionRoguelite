extends CharacterBody2D
class_name Entity

@onready var entity_movement: EntityMovement = $EntityMovement
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var entity_collision_shape: CollisionShape2D = $EntityCollisionShape
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent

@export var stats: StatsComponent

func _ready() -> void:
	# All entities connect to this signal
	hurtbox_component.hurt.connect(got_hit)
	stats.no_health.connect(queue_free)
	
func got_hit(_hitbox: HitboxComponent, received_attack: Attack) -> void:
	# Subtract health with the damage that was dealt
	stats.health -= received_attack.damage
	hurtbox_component.start_invincibility(1)
	print(received_attack.damage)
