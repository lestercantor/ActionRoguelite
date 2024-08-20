class_name Enemy
extends Node2D

@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent

@export var stats: StatsComponent 
@export var upgrades: BaseUpgrade:
	set(value):
		upgrades = value

@export var ability: Ability
@onready var player: Player = get_tree().current_scene.get_node("Player")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hurtbox_component.hurt.connect(test)
	stats.no_health.connect(queue_free)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func test(_hitbox: HitboxComponent, attack: Attack) -> void:
	# Subtract health with the damage that was dealt
	stats.health -= attack.damage
	hurtbox_component.start_invincibility(1)
	print("health remaining: ", stats.health)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("add_damage"):
		upgrades.apply_upgrade(stats)


func _on_shoot_ability_timeout() -> void:
	var direction = (player.global_position - global_position).normalized()
	ability.use_ability(self, direction)
