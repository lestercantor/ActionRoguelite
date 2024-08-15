class_name Enemy
extends Node2D

@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent

@export var stats_component: StatsComponent 
@export var upgrades: BaseUpgrade:
	set(value):
		upgrades = value
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hurtbox_component.hurt.connect(test)
	stats_component.no_health.connect(queue_free)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func test(_hitbox: HitboxComponent, attack: Attack) -> void:
	# Subtract health with the damage that was dealt
	stats_component.health -= attack.damage
	hurtbox_component.start_invincibility(0.1)
	print("health remaining: ", stats_component.health)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("add_damage"):
		upgrades.apply_upgrade(stats_component)
