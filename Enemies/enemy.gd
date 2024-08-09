extends Node2D

@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent

@export var stats_component: StatsComponent 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hurtbox_component.hurt.connect(test)
	stats_component.no_health.connect(queue_free)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func test(_hitbox: HitboxComponent, attack: Attack) -> void:
	stats_component.health -= attack.damage
	print("health remaining: ", stats_component.health)
